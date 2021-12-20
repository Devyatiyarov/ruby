require_relative 'spec_helper'
require_relative '../lib/types/fahrenheit'

describe Fahrenheit do
  describe '#to_kelvin' do
    subject { Fahrenheit.new(123).to_kelvin }
    it { is_expected.to eq(323.71) }
  end

  describe '#to_celsius' do
    subject { Fahrenheit.new(-123).to_celsius }
    it { is_expected.to eq(-86.11) }
  end
end
