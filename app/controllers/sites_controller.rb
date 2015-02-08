class SitesController < ApplicationController
  $get_url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"

    def map
        input_url = "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1az100jazgr_82rpe&zpid=48749425"
        @doc = Nokogiri::HTML(open(input_url)) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT
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
    end
end
