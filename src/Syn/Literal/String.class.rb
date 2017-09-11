include Literal

def to_s
  "\"#{@string}\""
end

def self.parsable? string
  string.start_with?('"') && string.end_with?('"')
end

def self.from_node node
  if node.type == :str
    literal = new
    literal.string = node.children.first
    literal
  end
end
