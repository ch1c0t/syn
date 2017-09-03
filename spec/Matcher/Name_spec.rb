require 'helper'

describe Syn::Matcher::Name do
  before do
    @matcher = described_class.new 'call something'
  end

  it do
    assert { @matcher.ok? }
    assert { @matcher.string == 'call something' }
    assert { @matcher.match == 'call' }
    assert { @matcher.postfix == ' something' }
  end
end
