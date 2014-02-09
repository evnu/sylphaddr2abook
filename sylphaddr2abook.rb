#!/usr/bin/ruby
#
# Convert a sylpheed address book to a abook
#
# Usage: sylphaddr2csv.rb [options]
#

require "nokogiri"

require_relative "opts"
require_relative "person"

options = Opts.parse(ARGV)

puts "Parsing #{options.addressbook}"

persons = File.open(options.addressbook) do |f|
    doc = Nokogiri::XML(f)
    doc.xpath('/address-book/person').map do |person_xml|
        person = Person.new
        person.first_name = person_xml['first-name']
        person.last_name = person_xml['last-name']
        person.nick_name = person_xml['nick-name']
        person.cn = person_xml['cn']
        person.addresses = person_xml.xpath("address-list/address").map do |addr_xml|
            addr = Address.new
            addr.alias = addr_xml["alias"]
            addr.email = addr_xml["email"]
            addr.remarks = addr_xml["remarks"]

            addr
        end

        person
    end
end

puts persons
