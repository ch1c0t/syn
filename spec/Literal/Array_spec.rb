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
end
