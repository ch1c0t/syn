include Matcher
  
BIG_LETTERS = ('A'..'Z').to_a
SMALL_LETTERS = ('a'..'z').to_a
DIGITS = (0..9).to_a

require 'set'
ACCEPTABLE_FIRST_CHARACTERS = [*BIG_LETTERS, *SMALL_LETTERS, '_'].to_set
ACCEPTABLE_CHARACTERS = [*BIG_LETTERS, *SMALL_LETTERS, *DIGITS, '_'].to_set
UNNACEPTABLE_CHARACTER = -> c { not ACCEPTABLE_CHARACTERS.include? c}

def parse
  if ACCEPTABLE_FIRST_CHARACTERS.include? first_character
    index = @start + 1
    char = @chars[index]

    until UNNACEPTABLE_CHARACTER === char
      index = index + 1
      char = @chars[index]
    end

    @range = @start..(index-1)
    @ok = true
  end
end
