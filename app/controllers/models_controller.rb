class ModelsController < ApplicationController

  before_action :set_brand

  def index
    @models = @brand.models
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

end
