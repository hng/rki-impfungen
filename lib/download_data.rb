require 'nokogiri'
require 'open-uri'
require 'date'

RKI_URL = 'https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.html'

doc = Nokogiri::HTML(URI.open(RKI_URL))

download_link = doc.css('#main .downloadLink').first
download_link_url = URI.join(RKI_URL, download_link['href']).to_s
download_link_title = download_link['title']

download_date_match = download_link_title.match(/(\d?\d\.\d?\d\.\d\d\d\d)/)
download_date = download_date_match.nil? ? Date.today.to_s : Date.parse(download_date_match[1]).to_s

open("data/Impfquotenmonitoring_#{download_date}.xlsx", 'wb') do |file|
  file << URI.open(download_link_url).read
end
