require_relative 'spec_helper'
require_relative '../lib/states/converter'

describe Converter do
  describe '#convert' do
    let(:context) { AppContext.new Converter.new }

    context 'when the celsius conversion scale' do
      before { context.from_type = 'Celsius' }
      subject { context.state.convert }
      it { is_expected.to be_a Celsius }
    end

    context 'when the kelvin conversion scale ' do
      before { context.from_type = 'Kelvin' }
      subject { context.state.convert }
      it { is_expected.to be_a Kelvin }
    end

    context 'when the fahrenheit conversion scale ' do
      before { context.from_type = 'Fahrenheit' }
      subject { context.state.convert }
      it { is_expected.to be_a Fahrenheit }
    end
  end
end
