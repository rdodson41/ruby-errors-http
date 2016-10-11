require 'spec_helper'

describe Errors::HTTP do
  describe '::VERSION' do
    it do
      expect(Errors::HTTP::VERSION).to eq '0.1.0'
    end
  end
end
