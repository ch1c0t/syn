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
end
