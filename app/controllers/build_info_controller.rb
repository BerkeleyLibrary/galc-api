class BuildInfoController < ApplicationController
  def index
    render jsonapi: BuildInfo.build_info
  end
end
