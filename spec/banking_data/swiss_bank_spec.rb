require 'spec_helper'

module BankingData
  describe SwissBank do
    describe 'end-to-end test' do
      ['SNBZCHZZXXX', 'UBSWCHZH31A', 'VBBECH22XXX'].each do |bic|
        it "includes #{bic}" do
          expect(SwissBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :ch).only(:bic).map(&:first))
            .to include(bic)
        end
      end

      it 'all bics are blank or look like bics' do
        bics = SwissBank.only(:bic).map(&:first)
        # regular expression: the bic should have 11 characters, that are either
        # all white space or consist of capital letters and digits
        expect(bics.select{ |bic| !( bic =~  /\A(\s|([A-Z]|\d)){11}\z/ ) }).
          to eq([])
      end
    end
  end
end
