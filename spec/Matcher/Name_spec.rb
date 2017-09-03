require 'helper'

describe Syn::Matcher::Name do
  before do
    @matcher = described_class.new 'call something'.chars
  end

  it do
    assert { @matcher.ok? }
    assert { @matcher.range == (0..3) }
    assert { @matcher.to_s == 'call' }
  end
end
