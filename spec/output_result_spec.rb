require_relative 'spec_helper'
require_relative '../lib/states/output_result'

describe OutputResult do
  describe '#next' do
    context 'when pressed q' do
      let(:context) { AppContext.new OutputResult.new 1 }
      let(:input) { StringIO.new('q') }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a Exit }
    end

    context 'when pressed enter' do
      let(:context) { AppContext.new OutputResult.new 1 }
      let(:input) { StringIO.new("\r") }

      before do
        $stdin = input
        context.render
        context.next
      end

      subject { context.state }
      it { is_expected.to be_a Clear }
    end
  end

  let(:state) { OutputResult.new 1 }
  let(:context) { AppContext.new state }
  describe '#print_top' do
    it { expect { state.print_top }.to output("Done:\n").to_stdout }
  end

  describe '#print_botton' do
    it { expect { state.print_botton }.to output("\npress enter to continue\npress q to exit\n").to_stdout }
  end
end
