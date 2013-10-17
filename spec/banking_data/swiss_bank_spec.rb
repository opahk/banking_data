require 'spec_helper'

module BankingData
  describe SwissBank do
    describe 'end-to-end test' do
      ['SNBZCHZZXXX', 'UBSWCHZH31A'].each do |bic|
        it "includes #{bic}" do
          expect(SwissBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :ch).only(:bic).map(&:first))
            .to include(bic)
        end
      end
    end
  end
end
