# Parse command line options

require 'optparse'
require 'ostruct'

module Opts
    def self.parse(args)
        options = OpenStruct.new

        opt_parser = OptionParser.new do |opts|
            opts.banner = "sylphaddr2csv.rb: convert sylpheed addressbook to csv"

            opts.on("-a","--addressbook ADDRESSBOOK", "Addressbook") do |v|
                options.addressbook = v
            end

            opts.on_tail("-h", "--help", "Show this message") do
                puts opts
                exit
            end
        end

        opt_parser.parse(args)

        if options.addressbook.nil?
            puts "Missing argument"
            puts opt_parser
            exit
        end

        options
    end
end
