require 'spec_helper'

describe Hdx404e do
  describe '#switch' do
    let(:matrix) { Hdx404e.new }

    it 'calculates the bytes correctly' do
      matrix.should_receive(:transmit).with("\x00\xff\xd5{")
      matrix.switch("A", "1")
      matrix.should_receive(:transmit).with("\x01\xfe\xd5{")
      matrix.switch("a", 2)
      matrix.should_receive(:transmit).with("\x04\xfb\xd5{")
      matrix.switch("B", "1")
      matrix.should_receive(:transmit).with("\x07\xf8\xd5{")
      matrix.switch("B", "4")
      matrix.should_receive(:transmit).with("\x0f\xf0\xd5{")
      matrix.switch("D", "4")
    end
  end
end