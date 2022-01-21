require 'active_support/core_ext/object/blank'

class BankingData::GermanBank < BankingData::Bank
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods

  LOCALE = :de

  attr_accessor :bic, :blz

  class << self

    delegate :where, :only, to: :query
    delegate :map, :each, to: :all

    def all
      @@all ||= get_all
    end

    private

      def get_all
        banks = []
        File.open(file, 'r:iso-8859-1').each_line do |line|
          blz = line[0..7]
          bic = line[139..149]
          banks << new(bic: bic, blz: blz)
        end
        banks.uniq
      end

      def file
        File.dirname(__FILE__) + '/../../data/blz_2021_12_06.txt'
      end
  end
end
