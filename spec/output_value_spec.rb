require_relative 'spec_helper'
require_relative '../lib/states/output_value'

describe OutputValue do
  let(:state) { OutputValue.new }
  let(:context) { AppContext.new state }
  describe '#print_top' do
    let(:expect_text) { "Enter the  value\n" }
    it { expect { context.state.print_top }.to output(expect_text).to_stdout }
  end

  describe '#print_main' do
    let(:expect_text) { 'value: ' }
    it { expect { context.state.print_main }.to output(expect_text).to_stdout }
  end

  describe '#print_botton' do
    let(:expect_text) { "\n\nthis is not a number" }
    it { expect { state.print_botton }.to output(expect_text).to_stdout }
  end

  describe '#render' do
    let(:expect_text) { "Enter the  value\nvalue: \e[2;8H" }
    it { expect { context.state.render }.to output(expect_text).to_stdout }
  end
end
