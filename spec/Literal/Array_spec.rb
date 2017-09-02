require 'helper'

describe Syn::Literal::Array do
  before do
    @literal = described_class.new
  end

  it do
    name = Syn::Literal::Name.new
    name.string = 'some_name'

    symbol = Syn::Literal::Symbol.new
    symbol.string = 'some_symbol'

    string = Syn::Literal::String.new
    string.string = 'some string'

    @literal[0] = name
    @literal[1] = symbol
    @literal[2] = string

    assert { @literal.to_s == "[some_name, :some_symbol, \"some string\"]" }
  end

  describe '.parsable?' do
    it 'is true when the argument is parsable' do
      assert { described_class.parsable? "[some_name, :some_symbol, \"some string\"]" }
      assert { described_class.parsable? "[]" }
    end

    it 'is false when the argument is unparsable' do
      assert { not described_class.parsable? "[some_name, :some_symbol, \"some string\"" }
      assert { not described_class.parsable? "some_name, :some_symbol, \"some string\"]" }
      assert { not described_class.parsable? "[" }
    end
  end

  describe '.parse' do
    it 'can parse parsable' do
      literal = described_class.parse "[some_name, :some_symbol, \"some string\"]"
      
      name = literal[0]
      symbol = literal[1]
      string = literal[2]

      assert { name.is_a? Syn::Literal::Name }
      assert { name.to_s == "some_name" }
      assert { symbol.is_a? Syn::Literal::Symbol }
      assert { symbol.to_s == ":some_symbol" }
      assert { string.is_a? Syn::Literal::String }
      assert { string.to_s == "\"some string\"" }
    end

    it 'returns nil for unparsable' do
      assert { described_class.parse("[some_name, :some_symbol, \"some string\"").nil? }
      assert { described_class.parse("some_name, :some_symbol, \"some string\"]").nil? }
      assert { described_class.parse("[").nil?}
    end
  end
end
