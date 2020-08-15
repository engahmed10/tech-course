require "uri"
require 'json'
require "net/http"
url = URI("https://data.cityofnewyork.us/resource/fgq8-am2v.json")
https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true
request = Net::HTTP::Get.new(url)
response = https.request(request)
response.read_body
hash = JSON.parse(response.read_body)


hash.each do |i|
 
    institute = Institute.find_or_create_by( name: i["organization_name"],address: i["address1"],url: i["website"],phone:i["phone1"],city: i["city"] )
    education=Education.new
    @course=Course.create(name: i["course_name"],course_description: i["coursedescription"],duration: i["duration"],cost_total: i["cost_total"],institute: institute,education: education)
end

