require 'active_support/core_ext/object/blank'

class BankingData::SwissBank < BankingData::Bank
  include ActiveModel::Model

  attr_accessor :bic

  def self.all
    banks = []
    File.read(file, encoding: 'iso-8859-1').lines.each do |line|
      kennzeichen = line[7..10]
      if kennzeichen == '0000'
        bic = line[284..294]
        banks << self.new(bic: bic)
      end
    end
    banks
  end

  def self.file
    File.dirname(__FILE__) + '/../../data/bcbankenstamm.txt'
  end
end
