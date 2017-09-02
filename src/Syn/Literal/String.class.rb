include Literal

def to_s
  "\"#{@string}\""
end

def self.parsable? string
  string.start_with?('"') && string.end_with?('"')
end

def self.parse string
  if parsable? string
    literal = new
    literal.string = string[1..-2]
    literal
  end
end
