class SitesController < ApplicationController
  $get_url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"

    def map


    end

    def one_address
    	doc = Nokogiri::HTML(open("http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1az100jazgr_82rpe&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA")) do |config|
      	config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
      	end
      	doc.xpath('//response//results').each do |thing|
      		@print_this_on_view = "DIE DUDE "+ thing.at_xpath('//result//zpid')
      	    puts @print_this_on_view
      		redirect_to '/map'
      	end
    end
end
