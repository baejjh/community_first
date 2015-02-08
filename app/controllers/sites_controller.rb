class SitesController < ApplicationController

    def map
        # INPUT ADDRESS
            @input_url = request.fullpath               #get full request from client
            @req_to_zillow_url = @input_url.to_s        #make it a string we can chop
            @please_work = @req_to_zillow_url[5..100]   #remove '/maps?'
        #END INPUT ADDRESS

        # #GET ZPID
        # new_url             = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"+@please_work
        # @display            = Nokogiri::HTML(open(new_url)) do |config|
        # config.options      = Nokogiri::XML::ParseOptions::STRICT
        # end
        # @display.xpath('//response').each do |thing|
        #     @get_zpid        = thing.at_xpath('//results//result//zpid').content unless path.at_xpath('//results//result//zpid').nil?
        # endÍ
        # puts "THIS IS A TERRIBLE IDEA"+@get_zpid.to_s

        # ZILLOW API
        
        input_url           = "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1az100jazgr_82rpe&zpid=48749425"
        # input_url           = "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id="+params["zws-id"]+"&zpid="+@zpid_string
        @doc                = Nokogiri::HTML(open(input_url)) do |config|
        config.options      = Nokogiri::XML::ParseOptions::STRICT
        end
        @doc.xpath('//response').each do |path|
            @latitude       = path.at_xpath('//address/latitude').content unless path.at_xpath('//address/latitude').nil?
            @longitude      = path.at_xpath('//address/longitude').content unless path.at_xpath('//address/longitude').nil?
            # img
            @imgsrc         = path.at_xpath('//images/image/url').content unless path.at_xpath('//images/image/url').nil?
            #basic info
            @address        = path.at_xpath('//address/street').content+" "+
                              path.at_xpath('//address/city').content+", "+
                              path.at_xpath('//address/state').content+" "+
                              path.at_xpath('//address/zipcode').content unless (path.at_xpath('//address/street').content+" "+
                              path.at_xpath('//address/city').content+", "+
                              path.at_xpath('//address/state').content+" "+
                              path.at_xpath('//address/zipcode')).nil?
            @neighborhood   = path.at_xpath('neighborhood').content unless path.at_xpath('neighborhood').nil?
            @schoolDistrict = path.at_xpath('schooldistrict').content unless path.at_xpath('schooldistrict').nil?
            # #first table
            @roomtype       = path.at_xpath('//editedfacts/rooms').content unless path.at_xpath('//editedfacts/rooms').nil?
            @sqft           = path.at_xpath('//editedfacts/finishedsqft').content unless path.at_xpath('//editedfacts/finishedsqft').nil?
            @lotsqft        = path.at_xpath('//editedfacts/lotsizesqft').content unless path.at_xpath('//editedfacts/lotsizesqft').nil?
            @familysize     = path.at_xpath('//editedfacts/usecode').content unless path.at_xpath('//editedfacts/usecode').nil?
            @yearbuilt      = path.at_xpath('//editedfacts/yearbuilt').content unless path.at_xpath('//editedfacts/yearbuilt').nil?
            @roof           = path.at_xpath('//editedfacts/roof').content unless path.at_xpath('//editedfacts/roof').nil?
            @heatingsystem  = path.at_xpath('//editedfacts/heatingsystem').content unless path.at_xpath('//editedfacts/heatingsystem').nil?

            # #second table
            @bedrooms       = path.at_xpath('//editedfacts/bedrooms').content.to_i.floor unless path.at_xpath('//editedfacts/bedrooms').nil?
            @bathrooms      = path.at_xpath('//editedfacts/bathrooms').content.to_i unless path.at_xpath('//editedfacts/bathrooms').nil?
            @lastsolddate   = path.at_xpath('//editedfacts/lastsolddate').content unless path.at_xpath('//editedfacts/lastsolddate').nil?
            @lastsoldprice  = path.at_xpath('//editedfacts/lastsoldprice').content unless path.at_xpath('//editedfacts/lastsoldprice').nil?
            @numoffloors    = path.at_xpath('//editedfacts/numfloors').content unless path.at_xpath('//editedfacts/numfloors').nil?
            @yearupdated    = path.at_xpath('//editedfacts/yearupdated').content unless path.at_xpath('//editedfacts/yearupdated').nil?
        end

        another_url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1az100jazgr_82rpe&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA"
        @html = Nokogiri::HTML(open(another_url)) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT
        end
        @html.xpath('//response//results//result').each do |path|
            @listingPrice    = path.at_xpath('//zestimate//amount').content.to_i unless path.at_xpath('//zestimate//amount').nil?
        end # END ZILLOW API
    end

    def calculator
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

        @units = params[:units].to_i || 1

        #LIHTC Calculation
        @tax_incentive = ((params[:listingPrice].to_i * 0.04)/12)/@units unless (((params[:listingPrice].to_i * 0.04)/12)/@units).nil?

        # Maximum Possible Rental Income
        @renters = params[:qualified_renters].to_i || 1
        case @renters
            when 1
            @result = 964.58 + @tax_incentive
            when 2
            @result = 1055.67 + @tax_incentive
            when 3
            @result = 1303.75 + @tax_incentive
            when 4
            @result = 1785.42 + @tax_incentive
            when 5
            @result = 2123.33 + @tax_incentive
            when 6
            @result = 2431.42 + @tax_incentive
            when 7
            @result = 2775.25 + @tax_incentive
            when 8
            @result = 2809.08 + @tax_incentive
        end
        flash[:max_lih_income] = @result
        flash[:tax_incentive] = @tax_incentive
        redirect_to '/map'
    end # end method map
end
