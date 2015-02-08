class CalculatorsController < ApplicationController
  def index
    # source: http://www.huduser.org/portal/datasets/fmr/fmrs/FY2015_code/2015state_summary.odn
    @fmr_income = 0

    @bedrooms = gets.bdrm
    case @bedrooms
    when 0
      @fmr_income = 972
    when 1
      @fmr_income = 1150
    when 2
      @fmr_income = 1415
    when 3
      @fmr_income = 2085
    when 4
      @fmr_income = 2506
    else
      puts "Please select a bedroom count"
    end
  end

  def show
  end
end
