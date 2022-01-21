require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/try'

class BankingData::AustrianBank < BankingData::Bank
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods

  LOCALE = :at

  attr_accessor :bic, :blz

  class << self

    delegate :where, :only, to: :query
    delegate :map, :each, to: :all

    def all
      @@all ||= get_all
    end

    def get_all
      banks = []
      SmarterCSV.process(file, opts).each do |line|
        blz = line[:bankleitzahl].to_s
        bic = line[:'swift_code']
        if blz && bic
          banks << new(bic: bic, blz: blz)
        end
      end
      banks.uniq
    end

    private

      def file
        File.dirname(__FILE__) +
          '/../../data/SEPA-ZV-VZ_gesamt_de_1642675944518_alte_Version.csv'
      end

      def opts
        {
          col_sep: ';',
          file_encoding: 'iso-8859-1'
        }
      end
  end
end
