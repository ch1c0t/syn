include Literal

def string= object
  string = object.to_s

  @string = if string.match /\s/
              ":\"#{string}\""
            else
              ":#{string}"
            end
end
