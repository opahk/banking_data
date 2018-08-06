require 'spec_helper'

module BankingData
  describe DutchBank do
    describe 'end-to-end test' do
      ['ABNANL2A', 'INGBNL2A', 'RABONL2U'].each do |bic|
        it "includes #{bic}" do
          expect(DutchBank.only(:bic).map(&:first)).to include(bic)
          expect(Bank.where(locale: :nl).only(:bic).map(&:first))
            .to include(bic)
        end
      end
    end
  end
end
