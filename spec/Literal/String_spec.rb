require 'helper'

describe Syn::Literal::String do
  before do
    @literal = described_class.new
  end

  it 'makes double-quoted strings' do
    @literal.string = 'some'
    assert { @literal.to_s == "\"some\"" }
  end

  describe '.parsable?' do
    it 'is true when the argument is parsable' do
      assert { described_class.parsable? "\"string\"" }
    end

    it 'is false when the argument is unparsable' do
      assert { not described_class.parsable? "some_name" }
      assert { not described_class.parsable? ":symbol" }
      assert { not described_class.parsable? "[array]" }
    end
  end

  describe '.parse' do
    it 'can parse parsable' do
      literal = described_class.parse "\"string\""
      assert { literal.to_s == '"string"' }
    end

    it 'returns nil for unparsable' do
      assert { described_class.parse("some_name").nil? }
      assert { described_class.parse(":symbol").nil? }
      assert { described_class.parse("[array]").nil? }
    end
  end
end
