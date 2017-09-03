def initialize chars, start_at: 0
  @chars = chars.freeze
  @start = start_at
  @ok = false
  parse
end

def ok?
  @ok
end

def to_s
  @chars[range].join
end

attr_reader :range, :error

# Parse chars; set @ok, and either @range or @error.
def parse
end

def first_character
  @chars[@start]
end
