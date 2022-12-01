class ImagesController < ApplicationController
  include ActionController::MimeResponds
  include JSONAPI::Pagination

  before_action :require_galc_admin!, only: %i[create destroy]
  before_action :set_image, except: %i[create]

  # TODO: do we really want/need to be sending images from the Rails app?

  # GET /images/1
  def show
    # TODO: store checksums, send ETags
    respond_to do |format|
      format.jsonapi { render jsonapi: @image } # TODO: add serializer
      format.jpeg { send_file @image.file_path, type: 'image/jpeg', disposition: 'inline' }
    end
  end

  def thumbnail
    # TODO: store checksums, send ETags
    respond_to do |format|
      format.jpeg { send_file @image.thumbnail_path, type: 'image/jpeg', disposition: 'inline' }
    end
  end

  # POST /images
  #
  # NOTE: In an ideal world we wouldn't process images synchronously,
  #       but it's safe enough given only admins can do it
  def create
    file = params.require(:file)
    @image = Image.from_uploaded_file(file)

    render plain: @image.id.to_s
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  rescue ActiveRecord::DeleteRestrictionError => e
    item_details = @image.items.pluck(:artist, :title).map { |a, t| "#{a}, #{t.inspect}" }.join('; ')
    e.message << ": #{item_details}"
    raise
  end

  # TODO: add test to enforce there's no route for PUT/PATCH

  private

  def set_image
    @image = Image.find(params[:id])
  end
end
