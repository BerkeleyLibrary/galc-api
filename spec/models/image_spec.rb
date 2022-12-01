require 'rails_helper'

describe Image do
  attr_reader :tmp_root
  attr_reader :tmp_images

  before do
    @tmp_root = Dir.mktmpdir(File.basename(__FILE__, '.rb'))
    allow(Rails.application.config).to receive(:galc_volume_root).and_return(tmp_root)

    @tmp_images = File.join(tmp_root, 'images')
    Dir.mkdir(tmp_images)
  end

  after do
    FileUtils.remove_entry(tmp_root)
  end

  describe :from_uploaded_file do
    attr_reader :source_file_path
    attr_reader :uploaded_file

    before do
      @source_file_path = 'spec/data/galc_volume/images/(Sato)Fog.jpg'

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
      expected_digest = Digest::MD5.hexdigest(original_data)

      uploaded_data = File.read(image.file_path, mode: 'rb')
      actual_digest = Digest::MD5.hexdigest(uploaded_data)

      expect(actual_digest).to eq(expected_digest)
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
end
