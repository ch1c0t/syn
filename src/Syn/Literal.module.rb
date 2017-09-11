def string= object
  @string = object.to_s
end

def to_s
  @string
end

def self.included literal
  literal.extend Singleton
end

module Singleton
  def parse string
    from_node Parser::CurrentRuby.parse string
  end
end
