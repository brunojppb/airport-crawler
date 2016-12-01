require 'net/http'
require 'json'
require 'nokogiri'

# Append letter at the end of the URL and .html extension
API_ENDPOINT = "https://www.world-airport-codes.com/alphabetical/airport-name/"

airports = []

('a'..'z').each do |letter|
  url = API_ENDPOINT + letter + '.html'
  puts "Endpoint hit: #{url}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  page = Nokogiri::HTML(response)

  # Parse table
  page.css('tbody').each do |tbody|
    tbody.css('tr').css('.table-link').each do |tr|
      airport = tr.css('th').css('a').text
      city = tr.css('td')[0].text
      country = tr.css('td')[1].text
      iata_code = tr.css('td')[2].text.length > 0 ? tr.css('td')[2].text : ""
      airport_data = "#{iata_code};#{airport};#{city};#{country}"
      airports << airport_data if iata_code.length > 0
    end
  end
end

puts "NUMBER OF AIRPORTS FOUND: #{airports.count}"

# output JSON file
File.open("airports.json", "w") do |file|
  file.write(airports.to_json)
end
