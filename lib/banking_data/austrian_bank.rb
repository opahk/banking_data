require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/try'

class BankingData::AustrianBank < BankingData::Bank
  include ActiveModel::Model

  attr_accessor :bic

  def self.all
    banks = []
    SmarterCSV.process(file, opts).each do |line|
      bic = line[:'swift-code'].try(:gsub, /"/, '')
      banks << new(bic: bic)
    end
    banks
  end

  def self.file
    File.dirname(__FILE__) +
      '/../../data/kiverzeichnis_gesamt_de_1381499802577.csv'
  end

  def self.opts
    {
      col_sep: ';',
      file_encoding: 'iso-8859-1',
      force_simple_split: true
    }
  end
end
