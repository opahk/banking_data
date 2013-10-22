require 'spec_helper'

module BankingData
  describe GermanBank do
    describe 'end-to-end test' do
      ['MARKDEF1100', 'PBNKDEFF100'].each do |bic|
        it "includes #{bic}" do
          expect(GermanBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :de).only(:bic).map(&:first))
            .to include(bic)
        end
      end
      ['76350000', '37040044'].each do |blz|
        it "includes #{blz}" do
          expect(GermanBank.only(:blz).map(&:first)).to include(blz)
          expect(GermanBank.only(:blz).flatten).to include(blz)
          expect(Bank.where(locale: :de, blz: blz).only(:blz).first)
            .to eq([blz])
          expect(Bank.where(blz: blz, locale: :de).only(:blz).last)
            .to eq([blz])
        end
      end
    end
  end
end
