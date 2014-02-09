#!/usr/bin/ruby
#
# Convert a sylpheed address book to a abook
#
# Usage: sylphaddr2csv.rb [options]
#
# Requirements:
# - Nokogiri
#

require "nokogiri"

require_relative "opts"
require_relative "person"

options = Opts.parse(ARGV)

converted_books = options.addressbooks.map do |bookpath|
    full_path = File.expand_path(bookpath)
    File.open(full_path) do |f|
        doc = Nokogiri::XML(f)
        doc.xpath('/address-book/person').map do |person_xml|
            person = Person.new
            person.first_name = person_xml['first-name']
            person.last_name = person_xml['last-name']
            person.nick_name = person_xml['nick-name']
            person.custom1 = person_xml['cn']
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
end

persons = converted_books.flatten

# format and output
def format_person(person, index)
    person_str = person.to_s
    "[#{index}]\n#{person_str}\n\n"
end

indices = options.initial_index..options.initial_index+persons.size
formatted = persons.zip(indices).map do |p,i|
    format_person(p, i)
end

puts formatted
