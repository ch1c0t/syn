include Literal

def self.parsable? string
  string.match? /\A\w+\z/
end

def self.parse string
  if parsable? string
    literal = new
    literal.string = string
    literal
  end
end
