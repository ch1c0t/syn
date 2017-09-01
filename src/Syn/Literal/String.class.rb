include Literal

def to_s
  "\"#{@string}\""
end

def self.parsable? string
  string.start_with?('"') && string.end_with?('"')
end
