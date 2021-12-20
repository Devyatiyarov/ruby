require_relative 'spec_helper'
require_relative '../lib/states/input_value'

describe InputValue do
  describe '#next' do
    context 'when enter number' do
      let(:context) { AppContext.new InputValue.new }
      let(:input) { StringIO.new("123\n") }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a Save }
    end

    context 'when enter not number' do
      let(:context) { AppContext.new InputValue.new }
      let(:input) { StringIO.new("lol\n") }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a OutputValue }
    end
  end
end
