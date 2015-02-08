class SitesController < ApplicationController
  $get_url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"

    def map
        input_url = "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1az100jazgr_82rpe&zpid=48749425"
        doc = Nokogiri::HTML(open(input_url)) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
        end
        doc.xpath('//response').each do |path|
            @latitude       = path.at_xpath('//address//latitude').content
            @longitude      = path.at_xpath('//address//longitude').content
            # img 
            @imgsrc         = path.at_xpath('//images//image//url').content
            #basic info
            @address        = path.at_xpath('//address//street').content+" "+
                              path.at_xpath('//address//city').content+", "+
                              path.at_xpath('//address//state').content+" "+
                              path.at_xpath('//address//zipcode').content
            @neighborhood   = path.at_xpath('//neighborhood').content
            # @schooldistrict = path.at_xpath('//schoolDistrict').content

            # #first table
            # @roomtype       = path.at_xpath('//editedFacts//rooms').content
            # @sqft           = path.at_xpath('//editedFacts//finishedSqFt').content
            # @lotsqft        = path.at_xpath('//editedFacts//lotSizeSqFt').content
            # @familysize     = path.at_xpath('//editedFacts//useCode').content
            # @yearbuilt      = path.at_xpath('//editedFacts//yearBuilt').content
            # @roof           = path.at_xpath('//editedFacts//roof').content
            # @heatingsystem  = path.at_xpath('//editedFacts//heatingSystem').content

            # #second table
            # @bedroom        = path.at_xpath('//editedFacts//bedrooms').content
            # @bathrooms      = path.at_xpath('//editedFacts//bathrooms').content
            # @lastsolddate   = path.at_xpath('//editedFacts//lastSoldDate').content
            # @lastsoldprice  = path.at_xpath('//editedFacts//lastSoldPrice').content
            # @numoffloors    = path.at_xpath('//localRealEstate//numFloors').content
            # @yearupdated    = path.at_xpath('//localRealEstate//yearUpdated').content
        end
    end
end
