require 'active_support/core_ext/object/blank'

class BankingData::GermanBank < BankingData::Bank
  include ActiveModel::Model

  LOCALE = :de

  attr_accessor :bic, :blz

  class << self

    delegate :where, :only, to: :query

    def all
      @@all ||= get_all
    end

    private

      def get_all
        banks = []
        File.open(file).each_line do |line|
          blz = line[0..7]
          bic = line[139..149]
          banks << new(bic: bic, blz: blz)
        end
        banks
      end

      def file
        File.dirname(__FILE__) + '/../../data/BLZ_20130909.txt'
      end
  end
end
