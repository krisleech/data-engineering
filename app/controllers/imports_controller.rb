class ImportsController < ApplicationController
  def index
  end

  def create
    @import = Import.new(tsv_data: params[:file].read)
    @import.commit
  end
end
