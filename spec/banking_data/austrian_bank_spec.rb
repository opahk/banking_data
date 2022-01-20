require 'spec_helper'

module BankingData
  describe AustrianBank do
    describe 'end-to-end test' do
      ['RCNOATW1XXX', 'EUAAATWWXXX'].each do |bic|
        it "includes #{bic}" do
          expect(AustrianBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :at).only(:bic).map(&:first))
            .to include(bic)
        end
      end

      ['19420', '15150'].each do |blz|
        it "includes #{blz}" do
          expect(AustrianBank.only(:blz).map(&:first)).to include(blz)
          expect(AustrianBank.only(:blz).flatten).to include(blz)
          expect(Bank.where(locale: :at, blz: blz).only(:blz).first)
            .to eq([blz])
          expect(Bank.where(blz: blz, locale: :at).only(:blz).last)
            .to eq([blz])
        end
      end

      it 'all bics are blank or have 11 non-white-space characters' do
        bics = AustrianBank.only(:bic).map(&:first)
        expect(bics.select{ |bic| ![0,11].include?(bic.delete(' ').length) }).
          to eq([])
      end
    end
  end
end
