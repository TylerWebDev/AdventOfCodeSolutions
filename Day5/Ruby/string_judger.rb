# Judges a line seperated list (string) of words for niceness
class StringJudger
  def judge_input(input)
    num_nice_strings = 0
    input.split("\n").each do |word|
      num_nice_strings += 1 if judge_string(word) == 'nice'
    end
    num_nice_strings
  end

  def letter_pair?(str)
    # returns false more often
    str.split('').each_with_index.any? do |letter, i|
      target = str[i..i.next]
      target.length == 2 && str.sub(target,' ').include?(target)
    end
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
    letter_pair?(str) && letter_sandwhich?(str)
  end

  # don't use this - it's old but necesary until refactored out
  def legacy_nice?(str)
    repeated_letters?(str) && !blacklisted_strings?(str) && three_vowels?(str)
  end

  def letter_sandwhich?(str)
    str.split('').any? do |letter, i|
      match = true if str=~(/#{letter}.#{letter}/) 
    end
  end

  def letter_sandwhich?(str)
    str.split('').any? do |letter, i|
      match = true if str=~(/#{letter}.#{letter}/) 
    end
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

input = File.read('nice_or_naughty_strings.txt')

# output solution to part 1
# puts StringJudger.new.legacy_judge_input(input)

# output solution to part 2
puts StringJudger.new.get_outliers(input)
