require 'spec_helper'

describe Errors::HTTP do
  describe '::VERSION' do
    it do
      expect(Errors::HTTP::VERSION).to eq '0.1.0'
    end
  end

  describe '#status' do
    it do
      expect(subject.status).to eq :internal_server_error
    end
  end

  describe '#code' do
    it do
      expect(subject.code).to eq Rack::Utils::SYMBOL_TO_STATUS_CODE[:internal_server_error]
    end
  end
end

Rack::Utils::SYMBOL_TO_STATUS_CODE.each do |status, code|
  describe Errors.const_get(status.to_s.camelize) do
    describe '#status' do
      it do
        expect(subject.status).to eq status
      end
    end

    describe '#code' do
      it do
        expect(subject.code).to eq Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
      end
    end
  end if (400...600).cover?(code)
end
