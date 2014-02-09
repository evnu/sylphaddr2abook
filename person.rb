#
# A simple class to describe a person and associated addresses
#

class Person
    attr_accessor :first_name, :last_name, :nick_name, :custom1
    attr_accessor :addresses

    def initialize()
        @addresses = []
        @custom = ""
    end

    def to_s
        addrs_str = addresses.map(&:to_s).join(',')
        full_name = "#{first_name} #{last_name}"
        [
            "name=#{full_name}",
            "nick=#{nick_name}",
            "email=#{addrs_str}",
            "custom1=#{custom1}"
        ].join("\n")
    end
end

class Address
    attr_accessor :alias, :email, :remarks

    def to_s
        "#{email}"
    end
end
