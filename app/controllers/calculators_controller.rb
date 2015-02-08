class CalculatorsController < ApplicationController
  def index
    #
    # source: http://www.huduser.org/portal/datasets/fmr/fmrs/FY2015_code/2015state_summary.odn
    # @fmr_income = 0

    # @bedrooms = gets.bdrm
    # case @bedrooms
    # when 0
    #   @fmr_income = 972
    # when 1
    #   @fmr_income = 1150
    # when 2
    #   @fmr_income = 1415
    # when 3
    #   @fmr_income = 2085
    # when 4
    #   @fmr_income = 2506
    # else
    #   puts "Please select a bedroom count"
    # end

    #LIHTC Calculation
    @listing_price = gets.listingPrice

    @listing_price = ((@listingPrice * .04)/12)

    #Maximum Possible Rental Income
    @max_lih_income = 0
    @renters = gets.qualified_renters
    case @renters
    when 1
    @max_lih_income = 964.58
    when 2
    @max_lih_income = 1055.67
    when 3
    @max_lih_income = 1303.75
    when 4
    @max_lih_income = 1785.42
    when 5
    @max_lih_income = 2123.33
    when 6
    @max_lih_income = 2431.42
    when 7
    @max_lih_income = 2775.25
    when 8
    @max_lih_income = 2809.08



  end

  def show
  end
end
