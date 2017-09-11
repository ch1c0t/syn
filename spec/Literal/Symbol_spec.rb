require 'helper'

describe Syn::Literal::Symbol do
  before do
    @literal = described_class.new
  end

  context 'when the string is with spaces' do
    it 'makes double-quoted symbols' do
      @literal.string = 'string with spaces'
      assert { @literal.to_s == ':"string with spaces"' }
    end
  end

  context 'when the string is without spaces' do
    it 'makes common symbols' do
      @literal.string = 'some'
      assert { @literal.to_s == ':some' }
    end
  end

  describe '.parse' do
    it 'can parse parsable' do
      literal = described_class.parse ":symbol"
      assert { literal.to_s == ':symbol' }

      literal = described_class.parse ':"with spaces"'
      assert { literal.to_s == ':"with spaces"' }
    end

    it 'returns nil for unparsable' do
      assert { described_class.parse("\"string\"").nil? }
      assert { described_class.parse("some_name").nil? }
      assert { described_class.parse("[array]").nil? }
    end
  end
end
