# Judges a line seperated list (string) of words for niceness
class StringJudger
  def judge_input(input)
    num_nice_strings = 0
    input.split("\n").each do |word|
      num_nice_strings += 1 if judge_string(word) == 'nice'
    end
    num_nice_strings
  end

  def legacy_judge_input(input)
    num_nice_strings = 0
    input.split("\n").each do |word|
      num_nice_strings += 1 if legacy_judge_string(word) == 'nice'
    end
    num_nice_strings
  end

  def judge_string(str)
    if nice?(str)
      'nice'
    else
      'naughty'
    end
  end

  def legacy_judge_string(str)
    if legacy_nice?(str)
      'nice'
    else
      'naughty'
    end
  end

  def nice?(str)
    letter_pair?(str)
  end

  # don't use this - it's old but necesary until refactored out
  def legacy_nice?(str)
    repeated_letters?(str) && !blacklisted_strings?(str) && three_vowels?(str)
  end

  def letter_pair?(str)
    match = false
    str.split('').each_with_index do |letter, i|
      if i + 1 < str.length
        target = letter + str[i+1]
        match = true if str.sub(target,'').include? target
      end
    end
    match
  end

  def three_vowels?(str)
    str.scan(/[aeiou]/).count >= 3
  end

  def repeated_letters?(str)
    str.split('').any? do |letter|
      str.include? "#{letter * 2}"
    end
  end

  def blacklisted_strings?(str)
    %w(ab cd pq xy).any? { |pattern| str.include? pattern }
  end
end

# output solution to part 1
# input = File.read('nice_or_naughty_strings.txt')
# puts StringJudger.new.judge_input(input)
