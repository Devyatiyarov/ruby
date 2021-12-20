require_relative 'spec_helper'
require_relative '../lib/types/celsius'

describe Celsius do
  describe '#to_fahrenheit' do
    subject { Celsius.new(123).to_fahrenheit }
    it { is_expected.to eq(253.4) }
  end

  describe '#to_kelvin' do
    subject { Celsius.new(-123).to_kelvin }
    it { is_expected.to eq(150.15) }
  end
end
