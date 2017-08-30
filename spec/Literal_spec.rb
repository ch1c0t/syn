require 'helper'

describe Syn::Literal do
  before do
    @literal = Class.new do
      include Syn::Literal
    end.new
  end

  it do
    @literal.string = "some string"
    assert { @literal.to_s == "some string" }
  end
end
