# Parse command line options

require 'optparse'
require 'ostruct'

module Opts
    def self.parse(args)
        options = OpenStruct.new

        # set defaults
        options.initial_index = 0
        options.addressbooks = []

        # build parser
        opt_parser = OptionParser.new do |opts|
            opts.banner = "sylphaddr2csv.rb: convert sylpheed address-book to csv"

            opts.on("-a","--address-book book1,book2,..", Array, "Address-books") do |list|
                options.addressbooks = list
            end

            opts.on("-i", "--initial_index INDEX", "Initial address output index") do |i|
                options.initial_index = i
            end

            opts.on_tail("-h", "--help", "Show this message") do
                puts opts
                exit
            end
        end

        opt_parser.parse(args)

        if options.addressbooks == []
            puts "Missing argument"
            puts opt_parser
            exit
        end

        options
    end
end
