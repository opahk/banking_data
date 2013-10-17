require 'spec_helper'

module BankingData
  describe GermanBank do
    describe 'end-to-end test' do
      ['MARKDEF1100', 'PBNKDEFF100'].each do |bic|
        it "includes #{bic}" do
          expect(GermanBank.only(:bic).map(&:first)).to include(bic)
        end
      end
    end
  end
end
