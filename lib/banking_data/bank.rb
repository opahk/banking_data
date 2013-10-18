module BankingData
  class Bank

    @@options = {}

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
      elsif options.empty?
        self
      else
        @@options = @@options.merge(options)
        self
      end
    end

    def self.only(*attributes)
      options = @@options
      @@options = {}
      all.select { |bank| options.map { |k, v| bank.send(k) == v }.all? }
        .map { |bank| attributes.map { |attr| bank.send(attr) } }
    end

    def self.to_a
      options = @@options
      @@options = {}
      all.select { |bank| options.map { |k, v| bank.send(k) == v }.all? }
    end
  end
end
