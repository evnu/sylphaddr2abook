#
# A simple class to describe a person and associated addresses
#

class Person
    attr_accessor :first_name, :last_name, :nick_name, :cn
    attr_accessor :addresses

    def initialize()
        @addresses = []
    end

    def to_s
        addrs_str = addresses.map(&:to_s).join(',')
        "#{last_name},#{first_name},#{nick_name},cn=#{cn},#{addrs_str}"
    end
end

class Address
    attr_accessor :alias, :email, :remarks

    def to_s
        "#{email}"
    end
end
