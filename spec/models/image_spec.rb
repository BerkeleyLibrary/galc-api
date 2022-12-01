require 'rails_helper'
require 'support/image_dir_context'

describe Image do
  include_context('temp image dir')

  attr_reader :source_file_path

  before do
    @source_file_path = File.join(images_orig, '(Sato)Fog.jpg')
  end

  describe :from_uploaded_file do
    attr_reader :uploaded_file

    def uploaded_file
      # Tempfile#path will return null if it's been unlinked (deleted)
      return @uploaded_file if @uploaded_file && @uploaded_file.path

      tmp = Tempfile.new.tap do |t|
        File.open(source_file_path, 'rb') { |f| IO.copy_stream(f, t) }
        t.rewind
      end

      options = {
        tempfile: tmp,
        filename: File.basename(source_file_path),
        type: 'image/jpeg'
      }
      @uploaded_file = ActionDispatch::Http::UploadedFile.new(options)
    end

    after do
      uploaded_file.close(true)
    end

    it 'creates an image record' do
      image = Image.from_uploaded_file(uploaded_file)
      expect(image).not_to be_nil
      expect(image).to be_persisted

      file_path = image.file_path
      expect(File.exist?(file_path)).to eq(true)

      thumbnail_path = image.thumbnail_path
      expect(File.exist?(thumbnail_path)).to eq(true)
    end

    it 'copies the original image' do
      image = Image.from_uploaded_file(uploaded_file)

      original_data = File.read(source_file_path, mode: 'rb')
      expected_size = original_data.bytesize
      expected_digest = Digest::MD5.hexdigest(original_data)

      uploaded_data = File.read(image.file_path, mode: 'rb')
      actual_size = uploaded_data.bytesize
      actual_digest = Digest::MD5.hexdigest(uploaded_data)

      aggregate_failures do
        expect(actual_size).to eq(expected_size)
        expect(actual_digest).to eq(expected_digest)
      end
    end

    it 'creates a thumbnail' do
      image = Image.from_uploaded_file(uploaded_file)

      thumbnail = Vips::Image.new_from_file(image.thumbnail_path)
      expect(thumbnail.width).to eq(Image::THUMBNAIL_WIDTH)

      original = Vips::Image.new_from_file(source_file_path)
      original_ratio = Rational(original.width, original.height)
      thumbnail_ratio = Rational(thumbnail.width, thumbnail.height)
      expect(thumbnail_ratio).to be_within('1/100'.to_r).of(original_ratio)
    end

    it 'handles name collisions' do
      image1 = Image.from_uploaded_file(uploaded_file)
      image2 = Image.from_uploaded_file(uploaded_file)

      expect(image2.id).not_to eq(image1.id)

      %i[file_path thumbnail_path].each do |path_attr|
        path1 = image1.send(path_attr)
        path2 = image2.send(path_attr)
        expect(path1).not_to eq(path2)

        data1 = File.read(path1, mode: 'rb')
        data2 = File.read(path2, mode: 'rb')

        digest1 = Digest::MD5.hexdigest(data1)
        digest2 = Digest::MD5.hexdigest(data2)
        expect(digest2).to eq(digest1)
      end
    end

    it 'sanitizes filenames' do
      bad_filename = "\u0000bad/\\?*:|\"<>\nfilename.jpg\u001f"
      good_filename = Zaru.sanitize!(bad_filename)

      uploaded_file.original_filename = bad_filename

      image = Image.from_uploaded_file(uploaded_file)
      expect(image.basename).to eq(good_filename)
    end
  end

  describe :destroy do
    attr_reader :image
    attr_reader :source_file_path
    attr_reader :source_thumbnail_path

    before do
      @image = create(:image)
      @source_file_path = File.join(images_orig, image.basename)
      @source_thumbnail_path = File.join(images_orig, image.thumbnail)
      FileUtils.cp(source_file_path, image.file_path)
      FileUtils.cp(source_thumbnail_path, image.thumbnail_path)
    end

    it 'deletes the image files' do
      file_path = image.file_path
      thumbnail_path = image.thumbnail_path
      expect(File.exist?(file_path)).to eq(true) # just to be sure
      expect(File.exist?(thumbnail_path)).to eq(true) # just to be sure

      image.destroy
      expect(File.exist?(file_path)).to eq(false)
      expect(File.exist?(thumbnail_path)).to eq(false)
    end

    it 'does not delete an image in use by an item' do
      item = create(:item)
      expect(item.image).to eq(image) # just to be sure

      expect { image.destroy }.to raise_error(ActiveRecord::DeleteRestrictionError)
      expect(Image.find(image.id)).to eq(image)
      expect(File.exist?(image.file_path)).to eq(true)
      expect(File.exist?(image.thumbnail_path)).to eq(true)
    end
  end
end
