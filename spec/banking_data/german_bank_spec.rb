require 'spec_helper'

module BankingData
  describe GermanBank do
    describe 'end-to-end test' do
      ['MARKDEF1100', 'BELADEBEXXX', 'SLZODE22XXX'].each do |bic|
        it "includes #{bic}" do
          expect(GermanBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :de).only(:bic).map(&:first))
            .to include(bic)
        end
      end

      ['76350000', '37040044', '40050150'].each do |blz|
        it "includes #{blz}" do
          expect(GermanBank.only(:blz).map(&:first)).to include(blz)
          expect(GermanBank.map(&:blz)).to include(blz)
          expect(GermanBank.only(:blz).flatten).to include(blz)
          expect(Bank.where(locale: :de, blz: blz).only(:blz).first)
            .to eq([blz])
          expect(Bank.where(blz: blz, locale: :de).only(:blz).last)
            .to eq([blz])
        end
      end

      it 'all bics are blank or look like bics' do
        bics = GermanBank.only(:bic).map(&:first)
        # regular expression: the bic should have 11 characters, that are either
        # all white space or consist of capital letters and digits
        expect(bics.select{ |bic| !( bic =~  /\A(\s|([A-Z]|\d)){11}\z/ ) }).
          to eq([])
      end

      it 'all blz consist of 8 digits' do
        blzs = GermanBank.only(:blz).map(&:first)
        expect(blzs.select{ |blz| !( blz =~  /\A\d{8}\z/ ) }).
          to eq([])
      end
    end
  end
end
