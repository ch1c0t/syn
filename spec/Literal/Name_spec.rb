require 'helper'

describe Syn::Literal::Name do
  it do
    true_name = described_class.new
    true_name.string = 'true'

    variable_name = described_class.new
    variable_name.string = 'some_variable'

    assert { true_name.to_s == 'true' }
    assert { variable_name.to_s == 'some_variable' }
  end

  describe '.parsable?' do
    it 'is true when the argument is parsable' do
      assert { described_class.parsable? "some_name" }
    end

    it 'is false when the argument is unparsable' do
      assert { not described_class.parsable? "\"string\"" }
      assert { not described_class.parsable? ":symbol" }
      assert { not described_class.parsable? "[array]" }
    end
  end

  describe '.parse' do
    it 'can parse parsable' do
      literal = described_class.parse 'some_name'
      assert { literal.to_s == 'some_name' }
    end

    it 'returns nil for unparsable' do
      assert { described_class.parse("\"string\"").nil? }
      assert { described_class.parse(":symbol").nil? }
      assert { described_class.parse("[array]").nil? }
    end
  end
end
