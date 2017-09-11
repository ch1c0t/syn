include Literal

def string= object
  string = object.to_s

  @string = if string.match /\s/
              ":\"#{string}\""
            else
              ":#{string}"
            end
end

def self.from_node node
  if node.type == :sym
    literal = new
    literal.string = node.children.first
    literal
  end
end
