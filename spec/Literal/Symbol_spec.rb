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

  describe '.parsable?' do
    it 'is true when the argument is parsable' do
      assert { described_class.parsable? ":symbol" }
    end

    it 'is false when the argument is unparsable' do
      assert { not described_class.parsable? "\"string\"" }
      assert { not described_class.parsable? "some_name" }
      assert { not described_class.parsable? "[array]" }
    end
  end
end
