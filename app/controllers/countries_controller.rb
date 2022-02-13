class CountriesController < ApplicationController
  def index
    render json: Country.all
  end

  def create
    country = Country.new(countryParams);
    if country.save
      render json: country, status: :created
    else
      render json: country.errors, status: :unprocessable_entity
    end
  end

  def countryParams
    params.require(:country).permit(:name, :alpha2_code, :alpha3_code);
  end
end
