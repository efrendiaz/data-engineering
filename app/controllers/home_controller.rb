class HomeController < ApplicationController
  def index
    "test"
  end

  def new
  end

  def create
    importer = Importer.new(params[:file])
    importer.import_data
    respond_to do |format|
      format.html { redirect_to(home_index_url) }
    end
  end

end
