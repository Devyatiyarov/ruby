require_relative 'spec_helper'
require_relative '../lib/types/kelvin'

describe Kelvin do
  describe '#to_fahrenheit' do
    subject { Kelvin.new(123).to_fahrenheit }
    it { is_expected.to eq(-238.27) }
  end

  describe '#to_celsius' do
    subject { Kelvin.new(-123).to_celsius }
    it { is_expected.to eq(-396.15) }
  end
end
