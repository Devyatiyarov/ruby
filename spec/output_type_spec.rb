require_relative 'spec_helper'
require_relative '../lib/states/output_type'

describe OutputType do
  let(:state) { OutputType.new }
  let(:context) { AppContext.new state }
  describe '#print_top' do
    let(:expect_text) { "convert from Kelvin \n" }
    it { expect { context.state.print_top }.to output(expect_text).to_stdout }
  end

  describe '#print_main' do
    let(:expect_text) do
      "\e[48;2;255;90;0m0) Kelvin\n\e[48;2;0;0;0m1) Fahrenheit\n\e[48;2;0;0;0m2) Celsius\n\e[48;2;0;0;0m\n"
    end
    it { expect { context.state.print_main }.to output(expect_text).to_stdout }
  end

  describe '#print_botton' do
    let(:expect_text) { "Help:\nuse the up and down arrows to select\npress q to exit\n" }
    it { expect { state.print_botton }.to output(expect_text).to_stdout }
  end
end
