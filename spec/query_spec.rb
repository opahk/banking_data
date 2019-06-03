require 'spec_helper'
require 'banking_data'

describe BankingData::Query do
  describe '#to_a' do
    it 'returns [] for unknown banks' do
      locale = :li

      bank = BankingData::Bank.subclasses.find do |bank_class|
        bank_class::LOCALE == locale
      end

      expect(bank).to be_nil

      query = BankingData::Query.new(
        locale: :li,
        blz: '8800'
      )

      expect(query.to_a).to be_empty
    end
  end
end
