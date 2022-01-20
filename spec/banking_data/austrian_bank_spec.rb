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

      it 'all bics are blank or look like bics' do
        bics = AustrianBank.only(:bic).map(&:first)
        # regular expression: the bic should have 11 characters, that are either
        # all white space or consist of capital letters and digits
        expect(bics.select{ |bic| !( bic =~  /\A(\s|([A-Z]|\d)){11}\z/ ) }).
          to eq([])
      end

      it 'all blz except two exceptions consist of 5 digits' do
        exceptions = ['1000', '100']
        blzs = AustrianBank.only(:blz).map(&:first) - exceptions
        expect(blzs.select{ |blz| !( blz =~  /\A\d{5}\z/ ) }).
          to eq([])
      end
    end
  end
end
