#!/usr/bin/env ruby
%w(rubygems).each{|r| require r}
require File.expand_path("./PJLink.rb")

address = "pves-lab-pj.d300.org"

pj = Projector.new(address)
puts "Manufacturer Name: #{pj.manufacturer_name}"
puts "Product Name: #{pj.product_name}"
puts "Name: #{pj.device_name}"
puts "Status: #{pj.power_status}"
print "Inputs: "
p pj.input_list
puts "Lamp hours: #{pj.lamp_hours}"

# pj.power_off

# pj.inputs_available.each{|inp|
#   pj.input(inp)
#   sleep 10
# }