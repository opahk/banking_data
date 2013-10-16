require 'active_support/core_ext/object/blank'

class BankingData::GermanBank
  include ActiveModel::Model

  attr_accessor :bic, :blz

  def self.all
    banks = []
    File.open(file).each_line do |line|
      blz = line[0..7]
      bic = line[139..149]
      banks << self.new(bic: bic, blz: blz)
    end
    banks
  end

  def self.only(*attributes)
    all.map { |bank| attributes.map { |attr| bank.send(attr) } }
  end

  def self.file
    File.dirname(__FILE__) + '/../../data/BLZ_20130909.txt'
  end
end
