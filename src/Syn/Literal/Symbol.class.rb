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
