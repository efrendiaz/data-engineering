class HomeController < ApplicationController
  def index
  end

  def new
  end

  def create
    importer = Importer.new(params[:file])
    @income = importer.import_data
    respond_to do |format|
      format.html { render "index" }
    end
  end

end
