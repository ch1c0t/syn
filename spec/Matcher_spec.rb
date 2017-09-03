require 'helper'

describe Syn::Matcher do
  before do
    @Matcher = Class.new do
      include Syn::Matcher
    end
  end

  describe 'default' do
    before do
      @matcher = @Matcher.new 'any string'
    end

    it 'is false for any string'do
      assert { not @matcher.ok? }
    end

    it '#string' do
      assert { @matcher.string == 'any string' }
    end

    it 'has nils in #match and #postfix when it is not ok' do
      assert { @matcher.match.nil? }
      assert { @matcher.postfix.nil? }
    end
  end
end
