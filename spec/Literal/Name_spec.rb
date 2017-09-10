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

  describe '.from_node' do
    it 'does create a literal from an appropriate send node' do
      node = Parser::CurrentRuby.parse 'na'
      literal = described_class.from_node node

      assert { literal.to_s == 'na' }
    end

    it 'does not create a literal from innapropriate nodes' do
      node = Parser::CurrentRuby.parse 'call name'
      assert { described_class.from_node(node).nil? }
    end
  end
end
