require_relative 'spec_helper'
require_relative '../lib/states/input_type'

describe InputType do
  describe '#next' do
    context 'when pressed enter' do
      let(:context) { AppContext.new InputType.new }
      let(:input) { StringIO.new("\r") }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a Save }
    end

    context 'when pressed arrow down' do
      let(:context) { AppContext.new InputType.new }
      let(:input) { StringIO.new('B') }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a OutputType }
    end
  end
end
