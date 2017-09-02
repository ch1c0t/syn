include Literal

def initialize
  @elements = []
end

def [] index
  @elements[index]
end

def []= index, value
  @elements[index] = value
end

def to_s
  "[#{@elements.join ', '}]"
end

def self.parsable? string
  string.start_with?('[') && string.end_with?(']')
end

def self.parse string
  if parsable? string
    array_literal = new

    elements = string[1..-2].split(', ')
    elements.each_with_index do |string, index|
      [Name, String, Symbol].each do |type|
        literal = type.parse string
        if literal
          array_literal[index] = literal
          break
        end
      end
    end

    array_literal
  end
end
