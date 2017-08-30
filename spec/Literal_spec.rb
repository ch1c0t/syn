require 'helper'

describe Syn::Literal do
  before do
    @literal = Class.new do
      include Syn::Literal
    end.new
  end

  describe '#string=' do
    it do
      @literal.string = "some string"
      assert { @literal.to_s == "some string" }
    end

    it 'converts objects with #to_s'do
      @literal.string = Module
      assert { @literal.to_s == 'Module' }
    end
  end
end
