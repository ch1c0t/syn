require 'helper'

describe Syn::Literal::String do
  before do
    @literal = described_class.new
  end

  it 'makes double-quoted strings' do
    @literal.string = 'some'
    assert { @literal.to_s == "\"some\"" }
  end
end
