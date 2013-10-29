require 'active_support/core_ext/object/blank'

class BankingData::SwissBank < BankingData::Bank
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods

  LOCALE = :ch

  attr_accessor :bic, :blz

  class << self

    delegate :where, :only, to: :query
    delegate :map, :each, to: :all

    def all
      @@all ||= get_all
    end

    def get_all
      banks = []
      File.read(file, encoding: 'iso-8859-1').lines.each do |line|
        kennzeichen = line[7..10]
        if kennzeichen == '0000'
          blz = line[2..6].strip
          bic = line[284..294]
          banks << new(bic: bic, blz: blz)
        end
      end
      banks.uniq
    end

    def file
      File.dirname(__FILE__) + '/../../data/bcbankenstamm.txt'
    end
  end
end
