module BankingData
  class Bank

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    class << self

      def where(options)
        Query.new(options)
      end

      def query
        Query.new(locale: self::LOCALE)
      end
    end
  end
end
