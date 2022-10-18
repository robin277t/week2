def mix(s1, s2)
  s1.gsub!(/[^a-z]/,"") 
  s2.gsub!(/[^a-z]/,"")
  
  split1 = split(s1)
  split2 = split(s2)
  
  comparisons = []

  split1.each_key { |thing|
    repeat1 = repeat(thing, split1[thing])
    repeat2 = repeat(thing, split2[thing])
    comparisons << compare(repeat1, repeat2)
  }

  split2.each_key { |thing|
    repeat1 = repeat(thing, split1[thing])
    repeat2 = repeat(thing, split2[thing])
    comparisons << compare(repeat1, repeat2) 
  }

comparisons.uniq.sort_by{|alph| alph.chars[2]}.sort_by{|len| -len.length}.join("/")
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