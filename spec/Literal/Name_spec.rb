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
end
