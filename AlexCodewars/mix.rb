def mix(s1, s2)
  s1.gsub!(/[^a-z]/,"") 
  s2.gsub!(/[^a-z]/,"")
  
  split1 = split(s1)
  split2 = split(s2)
  
  comparisons = []

  split1.each_key { |thing|
    repeat1 = repeat(thing, split1[thing])
    repeat2 = repeat(thing, split2[thing])
    final_string = compare(repeat1, repeat2)
    comparisons << final_string if final_string.length>3
  }

  split2.each_key { |thing|
    repeat1 = repeat(thing, split1[thing])
    repeat2 = repeat(thing, split2[thing])
    final_string = compare(repeat1, repeat2)
    comparisons << final_string if final_string.length>3
  }

#comparisons.uniq.sort_by{|alph| -alph.chars[2]}.sort_by{|startchar| startchar.chars[0]}.sort_by{|len| -len.length}.join("/")

comparisons.uniq.sort_by{|all| [-all.length, all.chars[0], -all.chars[2]]}.join("/")

end

def split(string)
  hash = {}
  string.each_char do |chr| 
    if (!hash.has_key?(chr))
      hash[chr] = 0
    end
    hash[chr] += 1
  end
  hash
end

def repeat(letter, times)
  if times == nil 
    return ""
  end
 letter * times
end

def compare(s1, s2)
  if s1.length == s2.length
    "=:" + s2
  elsif s1.length > s2.length
    "1:" + s1
  else
    "2:" + s2
  end
end

=begin
solution best pracise:

1. loops through a to z, selects the letter if more than one occur in either s1 or s2, and puts that into a new array
2. enumerates over this array, mapping with a !. Takes each letter and checks it's count in s1 and s2 and returns the string of 1,2, or =, followed by
the letter * its count in a string interpolation
3. new array is then sorted by reverse size, followed by starting symbol, followed by alphabet (same way I did it) and joined with a /

def mix(s1, s2)
  selection = ('a'..'z').to_a.select { |letter| s1.count(letter) > 1 || s2.count(letter) > 1 }
  selection.map! do |selection| 
    if s1.count(selection) > s2.count(selection)
      "1:#{selection * s1.count(selection)}"
    elsif s1.count(selection) < s2.count(selection)
      "2:#{selection * s2.count(selection)}"
    else
      "=:#{selection * s1.count(selection)}"
    end
  end
  selection.sort_by { |x| [-x.size, x[0], x[-1]] }.join("/")
end

=end