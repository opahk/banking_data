module BankingData
  class Bank

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
