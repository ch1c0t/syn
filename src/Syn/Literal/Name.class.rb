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

def self.from_node node
  size = node.children.size
  first = node.children[0]
  second = node.children[1]

  if (size == 2) && first.nil? && second.is_a?(::Symbol)
    literal = new
    literal.string = second
    literal
  end
end
