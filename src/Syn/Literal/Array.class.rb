include Literal

def initialize
  @elements = []
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
