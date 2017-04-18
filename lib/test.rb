require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://gasprices.aaa.com/?state=CA"))

x = page.xpath('//table/tbody/tr/td')

puts x[1].text.tr('$', '')