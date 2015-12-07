# Judges a line seperated list (string) of words for niceness
class StringJudger
  def judge_input(input)
    nice_strings = 0
    input.split("\n").each do |word|
      nice_strings += 1 if judge_string(word) == 'nice'
    end
    nice_strings
  end

  private

  def judge_string(str)
    if nice?(str)
      'nice'
    else
      'naughty'
    end
  end

  def nice?(str)
    repeated_letters?(str) && !blacklisted_strings?(str) && three_vowels?(str)
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
