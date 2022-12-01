require 'rails_helper'
require 'support/image_dir_context'

describe ImagesController, type: :request do
  include_context('temp image dir')

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

  describe 'reading' do
    describe :show do
      it 'by default, returns a JSONAPI record' do
        get image_path(image)

        expect(response).to be_successful
        expect(response.content_type).to start_with(JSONAPI::MEDIA_TYPE)
        parsed_response = JSON.parse(response.body)

        links = parsed_response.delete('links')
        expect(links['self']).to eq(image_url(image))

        expect(parsed_response).to contain_jsonapi_for(image)
      end

      it 'with .jpg, returns the image' do
        original_data = File.read(source_file_path, mode: 'rb')
        expected_size = original_data.bytesize
        expected_digest = Digest::MD5.hexdigest(original_data)

        get image_path(image, format: :jpg)

        expect(response).to be_successful
        expect(response.content_type).to start_with(Image::JPEG_MIME_TYPE)

        headers = response.headers
        expect(headers['Content-Disposition']).to start_with('inline')
        expect(headers['Content-Length']).to eq(expected_size.to_s)

        uploaded_data = response.body
        actual_size = uploaded_data.bytesize
        actual_digest = Digest::MD5.hexdigest(uploaded_data)

        aggregate_failures do
          expect(actual_size).to eq(expected_size)
          expect(actual_digest).to eq(expected_digest)
        end
      end
    end

    describe :thumbnail do
      it 'with .jpg, returns the thumbnail' do
        original_data = File.read(source_thumbnail_path, mode: 'rb')
        expected_size = original_data.bytesize
        expected_digest = Digest::MD5.hexdigest(original_data)

        get thumbnail_path(image, format: :jpg)

        expect(response).to be_successful
        expect(response.content_type).to start_with(Image::JPEG_MIME_TYPE)

        headers = response.headers
        expect(headers['Content-Disposition']).to start_with('inline')
        expect(headers['Content-Length']).to eq(expected_size.to_s)

        uploaded_data = response.body
        actual_size = uploaded_data.bytesize
        actual_digest = Digest::MD5.hexdigest(uploaded_data)

        aggregate_failures do
          expect(actual_size).to eq(expected_size)
          expect(actual_digest).to eq(expected_digest)
        end
      end
    end
  end

  describe 'writing' do
    context 'as admin' do
      include_context 'admin request'

      describe :create do
        it 'creates an image' do
          post images_path, params: { file: fixture_file_upload(source_file_path, Image::JPEG_MIME_TYPE) }

          expect(response).to be_successful
          expect(response.content_type).to start_with('text/plain')

          image = Image.find(response.body.strip.to_i)

          original_data = File.read(source_file_path, mode: 'rb')
          expected_size = original_data.bytesize
          expected_digest = Digest::MD5.hexdigest(original_data)

          uploaded_data = File.read(image.file_path, mode: 'rb')
          actual_size = uploaded_data.bytesize
          actual_digest = Digest::MD5.hexdigest(uploaded_data)

          thumbnail = Vips::Image.new_from_file(image.thumbnail_path)
          original = Vips::Image.new_from_file(source_file_path)
          original_ratio = Rational(original.width, original.height)
          thumbnail_ratio = Rational(thumbnail.width, thumbnail.height)

          aggregate_failures do
            expect(actual_size).to eq(expected_size)
            expect(actual_digest).to eq(expected_digest)
            expect(thumbnail.width).to eq(Image::THUMBNAIL_WIDTH)
            expect(thumbnail_ratio).to be_within('1/100'.to_r).of(original_ratio)
          end
        end
      end

      describe :destroy do
        attr_reader :image

        before do
          post images_path, params: { file: fixture_file_upload(source_file_path, Image::JPEG_MIME_TYPE) }
          @image = Image.find(response.body.strip.to_i)
        end

        it 'destroys an image' do
          expect { delete image_url(image) }.to change(Image, :count).by(-1)

          expect(response).to have_http_status(:no_content)
          expect(response.body).to be_empty

          expect(Image.where(id: image.id)).not_to exist
        end

        it 'deletes the image files' do
          file_path = image.file_path
          thumbnail_path = image.thumbnail_path
          expect(File.exist?(file_path)).to eq(true) # just to be sure
          expect(File.exist?(thumbnail_path)).to eq(true) # just to be sure

          delete image_url(image)
          expect(File.exist?(file_path)).to eq(false)
          expect(File.exist?(thumbnail_path)).to eq(false)
        end

        it 'does not delete an image in use by an item' do
          item = create(:item, image: image)

          count_before = Image.count
          delete image_url(image)

          expect(response).to have_http_status(:conflict)
          expect(Image.count).to eq(count_before)

          expect(Image.find(image.id)).to eq(image)
          expect(File.exist?(image.file_path)).to eq(true)
          expect(File.exist?(image.thumbnail_path)).to eq(true)

          expect(Item.find(item.id)).to eq(item)

          parsed_response = JSON.parse(response.body)
          errors = parsed_response['errors']
          expect(errors).to be_a(Array)
          expect(errors.size).to eq(1)

          detail = errors[0]['detail']
          expect(detail).to include(item.artist)
          expect(detail).to include(item.title)
        end
      end
    end

    context 'as patron' do
      include_context 'patron request'

      describe :create do
        it 'returns 403 Forbidden' do
          count_before = Image.count
          post images_path, params: { file: fixture_file_upload(source_file_path, Image::JPEG_MIME_TYPE) }

          expect(response).to have_http_status(:forbidden)
          expect(Image.count).to eq(count_before)
        end
      end

      describe :destroy do
        attr_reader :image

        before do
          @image = create(:image)
          source_file_path = File.join(images_orig, image.basename)
          source_thumbnail_path = File.join(images_orig, image.thumbnail)
          FileUtils.cp(source_file_path, image.file_path)
          FileUtils.cp(source_thumbnail_path, image.thumbnail_path)
        end

        it 'returns 403 Forbidden' do
          count_before = Image.count
          delete image_url(image)

          expect(response).to have_http_status(:forbidden)
          expect(Image.count).to eq(count_before)

          expect(Image.find(image.id)).to eq(image)
          expect(File.exist?(image.file_path)).to eq(true)
          expect(File.exist?(image.thumbnail_path)).to eq(true)
        end
      end
    end

    context 'without login' do
      describe :create do
        it 'returns 401 Unauthorized' do
          count_before = Image.count
          post images_path, params: { file: fixture_file_upload(source_file_path, Image::JPEG_MIME_TYPE) }

          expect(response).to have_http_status(:unauthorized)
          expect(Image.count).to eq(count_before)
        end
      end

      describe :destroy do
        attr_reader :image

        before do
          @image = create(:image)
          source_file_path = File.join(images_orig, image.basename)
          source_thumbnail_path = File.join(images_orig, image.thumbnail)
          FileUtils.cp(source_file_path, image.file_path)
          FileUtils.cp(source_thumbnail_path, image.thumbnail_path)
        end

        it 'returns 401 Unauthorized' do
          count_before = Image.count
          delete image_url(image)

          expect(response).to have_http_status(:unauthorized)
          expect(Image.count).to eq(count_before)

          expect(Image.find(image.id)).to eq(image)
          expect(File.exist?(image.file_path)).to eq(true)
          expect(File.exist?(image.thumbnail_path)).to eq(true)
        end
      end
    end
  end
end
