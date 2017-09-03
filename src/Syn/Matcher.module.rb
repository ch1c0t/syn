def initialize chars, start_at: 0
  @chars = chars.freeze
  @start = start_at
  @ok = false
  parse
end

def ok?
  @ok
end

attr_reader :range, :error

# Parse chars; set either a range or an error.
def parse
end
