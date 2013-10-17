require 'spec_helper'

module BankingData
  describe AustrianBank do
    describe 'end-to-end test' do
      ['ABAGATWW', 'ABVRATW1'].each do |bic|
        it "includes #{bic}" do
          expect(AustrianBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :at).only(:bic).map(&:first))
            .to include(bic)
        end
      end
    end
  end
end
