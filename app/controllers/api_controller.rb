class ApiController < ApplicationController
  def fetch_categories
    @industry = Industry.find(params[:industry_id])

    render json: @industry.categories
  end

  def fetch_subcategories
    @category = Category.find(params[:category_id])

    render json: @category.subcategories
  end

  def fetch_provinces
    @country = Country.find(params[:country_id])

    render json: @country.provinces
  end

  def fetch_cities
    @province = Province.find(params[:province_id])

    render json: @province.cities
  end
end