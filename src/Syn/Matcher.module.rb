def initialize string
  @string = string
  @ok = false
end

def ok?
  @ok
end

attr_reader :string, :match, :postfix
