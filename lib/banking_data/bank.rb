module BankingData
  class Bank

    # goal: do something like:
    # BankingData::Bank.where(locale: :de).only(:bic)
    def self.where(options = {})
      locale = options.delete(:locale)
      if locale == 'DE' || locale == :de
        GermanBank.where(options)
      elsif locale == 'AT' || locale == :at
        AustrianBank.where(options)
      elsif locale == 'CH' || locale == :ch
        SwissBank.where(options)
      end
    end

    def self.only(*attributes)
      all.map { |bank| attributes.map { |attr| bank.send(attr) } }
    end
  end
end
