include Literal

def self.parsable? string
  string.match? /\A\w+\z/
end
