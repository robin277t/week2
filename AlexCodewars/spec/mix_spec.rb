require_relative "../mix"

#Note that a bunch of these tests have been skipped as a result of filtering out by a single letter late on in the kata.

describe "mix" do
  xit "1 returns the string id & letters in the string" do
    expect(mix("n", "")).to eq("1:n")
  end

  it "2 returns the same number of letters as there are in the string" do
    expect(mix("nn", "")).to eq("1:nn")
  end

  it "3 looks at the second string and returns according to which has more ns in it" do
    expect(mix("n", "nn")).to eq("2:nn")
  end

  xit "4 compares both strings and returns an e where the number of ns are identical" do
    expect(mix("n", "n")).to eq("=:n")
  end

  xit "5 splits out multiple letters and handles them individually" do
    expect(mix("ab", "")).to eq("1:a/1:b")
  end

  it "6 splits out 2 letters and handles them from 2 strings" do
    expect(mix("ab","aabb")).to eq("2:aa/2:bb")
  end

  it "7 splits out 3 letters and handles them from 2 strings only max" do
    expect(mix("abcc","aabbc")).to eq("1:cc/2:aa/2:bb")
  end

  it "8 splits out 3 letters and handles them from 2 strings with =" do
    expect(mix("abccddd","aabbcddd")).to eq("=:ddd/1:cc/2:aa/2:bb")
  end

  xit "9 splits out 3 letters and handles them from 2 strings with  different order=" do
    expect(mix("daccb","cbadde")).to eq("1:cc/2:dd/2:e/=:a/=:b")
  end

  xit "10 splits out 3 letters and handles them from 2 strings with = and extra letter at end" do
    expect(mix("abcccd","abcdde")).to eq("1:ccc/2:dd/2:e/=:a/=:b")
  end


  xit "18 returns correct alphabetical and length order of simple strings" do
    expect(mix("abdccc","ffeecabddd")).to eq("1:ccc/2:ddd/2:ee/2:ff/=:a/=:b")
  end

  xit "19 returns correct alphabetical and length order of simple strings whitespace check" do
    expect(mix("abd ccc","ffee   cabddd")).to eq("1:ccc/2:ddd/2:ee/2:ff/=:a/=:b")
  end 

  xit "20 returns correct alphabetical and length order of simple strings capitals check" do
    expect(mix("abdGccc","ffeeGGcabddd")).to eq("1:ccc/2:ddd/2:ee/2:ff/=:a/=:b")
  end 

  xit "21 returns correct alphabetical and length order of simple strings capitals and symbols/numbers check" do
    expect(mix("abd  !Gccc","ffeeGGc!!? LLabddd")).to eq("1:ccc/2:ddd/2:ee/2:ff/=:a/=:b")
  end 

  describe "split" do
    it "11 returns a hash with the letters in it" do
      expect(split("n")).to eq({"n" => 1})
    end

    it "12 counts the number of each letter which is present" do
      expect(split("nn")).to eq({"n" => 2})
    end

    it "13 counts each letter separately" do
      expect(split("ab")).to eq({"a" => 1, "b" => 1})
    end

    it "14 counts all the letters in a sentence without spaces" do
      expect(split("sillylittlesentence")).to eq({
        "c" => 1,
        "e" => 4,
        "i" => 2,
        "l" => 4,
        "n" => 2,
        "s" => 2,
        "t" => 3,
        "y" => 1
       })
    end
  end

  describe "repeat" do
    it "15 repeats the letter it is given" do
      expect(repeat("n", 1)).to eq("n")
    end

    it "16 repeats the letter as many times as it is given" do
      expect(repeat("n", 2)).to eq("nn")
    end

    it "17 returns an empty string if there is no number given" do
      expect(repeat("n", nil)).to eq("")
    end



  end
end