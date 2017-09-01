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
end
