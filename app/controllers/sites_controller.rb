class SitesController < ApplicationController
  $get_url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"
  def map
  end

  def one_address
  	# crawler = Crawler.new
  	# @keywords = crawler.obtain("http://www.zillow.com/webservice/GetDeepSearchResults.htm?", 1)
  	# render :xml => @keywords
	doc = Nokogiri::HTML(open("http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1az100jazgr_82rpe&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA")) do |config|
  	config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
  	end
  	doc.xpath('//response').each do |thing|
  		@print_this_on_view = "ALYSSA "+ thing.at_xpath('//results//result//zpid').content
  		puts @print_this_on_view
  		redirect_to '/map'
  	end
  end
end
