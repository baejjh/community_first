class CalculatorsController < ActionController::Base

    def index
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

        @units = params[:unit].to_i || 0

        #LIHTC Calculation
        @tax_incentive = (((params[:listingPrice].to_i * 0.04)/12)/@units) unless (((params[:listingPrice].to_i * 0.04)/12)/@units).nil?

        # Maximum Possible Rental Income
        @max_lih_income=0 
            @renters = params[:qualified_renters].to_i || 0
            case @renters
                when 1
                @max_lih_income = 964.58 + @tax_incentive
                when 2
                @max_lih_income = 1055.67 + @tax_incentive
                when 3
                @max_lih_income = 1303.75 + @tax_incentive
                when 4
                @max_lih_income = 1785.42 + @tax_incentive
                when 5
                @max_lih_income = 2123.33 + @tax_incentive
                when 6
                @max_lih_income = 2431.42 + @tax_incentive
                when 7
                @max_lih_income = 2775.25 + @tax_incentive
                when 8
                @max_lih_income = 2809.08 + @tax_incentive
            end
        render '/map'
    end # end method index
end