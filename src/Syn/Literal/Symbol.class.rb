include Literal

def string= object
  string = object.to_s

  @string = if string.match /\s/
              ":\"#{string}\""
            else
              ":#{string}"
            end
end

def self.parsable? string
  string.start_with? ':'
end

def self.parse string
  if parsable? string
    literal = new
    literal.string = if string.match? /\s/
                       string[2..-2]
                     else
                       string[1..-1]
                     end
    literal
  end
end
