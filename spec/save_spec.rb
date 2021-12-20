require_relative 'spec_helper'
require_relative '../lib/states/save'

describe Save do
  describe '#next' do
    context 'when the first scale was chosen' do
      let(:context) { AppContext.new Save.new 0 }
      before { context.next }
      subject { context.state }
      it { is_expected.to be_a OutputType }
    end

    context 'when the second scale was chosen' do
      let(:context) { AppContext.new Save.new 0 }
      before do
        context.from_type = 'Celsius'
        context.next
      end
      subject { context.state }
      it { is_expected.to be_a OutputValue }
    end

    context 'when the value was entered' do
      let(:context) { AppContext.new Save.new 0 }
      before do
        context.from_type = 'Celsius'
        context.to_type = 'Kelvin'
        context.next
      end
      subject { context.state }
      it { is_expected.to be_a Converter }
    end
  end
end
