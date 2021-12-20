require_relative 'spec_helper'
require_relative '../lib/states/clear'

describe Clear do
  describe '#render' do
    let(:context) { AppContext.new Clear.new }
    before { context.render }
    it { expect(context.from_type).to eq '' }
    it { expect(context.to_type).to eq '' }
    it { expect(context.value).to eq nil }
    it { expect(context.types).to eq %w[Kelvin Fahrenheit Celsius] }
  end
end
