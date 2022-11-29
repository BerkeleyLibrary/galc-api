class ImagesController < ApplicationController
  include JSONAPI::Pagination

  before_action :require_galc_admin!, only: %i[create destroy]
  before_action :set_image, only: %i[show destroy]

  # GET /images/1
  def show
    respond_to do |format|
      format.jsonapi { render jsonapi: @image }
      format.jpg { send_file @image.file_path, type: 'image/jpeg', disposition: 'inline' }
    end
  end

  def thumbnail
    respond_to do |format|
      format.jpg { send_file @image.thumbnail_path, type: 'image/jpeg', disposition: 'inline' }
    end
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @image.save!

    render plain: @image.id
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  # TODO: add test to enforce there's no route for PUT/PATCH

  private

  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_params
    params.fetch(:image, {})
  end
end
