require 'helper'

describe Syn::Matcher do
  before do
    @Matcher = Class.new do
      include Syn::Matcher
    end
  end

  describe 'default' do
    before do
      @matcher = @Matcher.new 'any string'.chars
    end

    it 'is false for any string'do
      assert { not @matcher.ok? }
      assert { @matcher.range.nil? }
    end
  end
end
