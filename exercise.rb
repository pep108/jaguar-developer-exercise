class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    out = str.split(" ").reduce([]) { |arr, s| 
      str_to_add = s

      if s.length > 4 then
        str_to_add = first_letter_is_capital(s) ? "Marklar" : "marklar"
        
        if string_ends_with_punctuation(s) then
          str_to_add += s[s.length - 1]
        end
      end

      arr.push(str_to_add)
    }

    out.join(" ")
  end
  
  # detect words where the first letter is capital: ascii 65 through 90
  def self.first_letter_is_capital(str)
    str[0].ord >= 65 && str[0].ord <= 90
  end
  
  # detect end of word punctuation: ascii 33,46,58,59,63
  def self.string_ends_with_punctuation(str)
    [33,46,58,59,63].include?(str[str.length - 1].ord)
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    sum = 0
    
    for a in 1..nth do
      x = nth_fibonacci(a)
      
      if x.even? then
        sum += x
      end  
    end
    
    sum
  end

  # returns the fibonacci number at the nth position
  # if n is 0 or 1, return n
  # else sum of the two preceding Fibonacci numbers
  def self.nth_fibonacci(n)
    n <= 1 ? n : nth_fibonacci(n - 1) + nth_fibonacci(n - 2);
  end

end
