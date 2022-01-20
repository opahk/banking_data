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

      it 'all bics are blank or have 11 non-white-space characters' do
        # to prevent errors through shifted characters, e.g. due tue encoding
        # errors
        bics = SwissBank.only(:bic).map(&:first)
        expect(bics.select{ |bic| ![0,11].include?(bic.delete(' ').length) }).
          to eq([])
      end
    end
  end
end
