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

    it 'all but one bics are blank or look like bics' do
      exceptions = ['BOFSNL21002']
      bics = DutchBank.only(:bic).map(&:first) - exceptions
      # regular expression: the bic should have 8 characters, that are either
      # all white space or consist of capital letters and digits
      expect(bics.select{ |bic| !( bic =~  /\A(\s|([A-Z]|\d)){8}\z/ ) }).
        to eq([])
    end
  end
end
