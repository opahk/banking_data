require 'active_support/core_ext/class/subclasses'
require 'active_support/core_ext/module/delegation'

module BankingData
  class Query

    delegate :each, :flatten, :map, :first, :last, to: :to_a
    attr_accessor :options, :attributes, :locale

    def initialize(options, only = nil)
      @locale = options.delete(:locale)
      @options = options
      @attributes = only
    end

    def where(opts = {})
      clone.tap do |query|
        query.locale = opts.delete(:locale)
        query.options = @options.merge(opts)
      end
    end

    def only(*attrs)
      clone.tap do |query|
        query.attributes = attrs
      end
    end

    def to_a
      return [] if bank.nil?

      data = bank.all
        .select { |bank| @options.map { |k, v| bank.send(k) == v }.all? }
      if @attributes
        data.map { |bank| @attributes.map { |attr| bank.send(attr) } }
      else
        data
      end
    end

    def bank
      Bank.subclasses.find { |bank_class| bank_class::LOCALE == locale }
    end
  end
end
