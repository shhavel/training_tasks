# frozen_string_literal: true

describe 'solution' do
  LETTERS = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z]
  DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

  def solution1(s)
    len, cnt_letters, cnt_digits, alphanumeric, max_len = 0, 0, 0, true, -1
    s.each_char do |ch|
      if ch == ' '
        max_len = [len, max_len].max if alphanumeric && cnt_letters.even? && cnt_digits.odd?
        len, cnt_letters, cnt_digits, alphanumeric = 0, 0, 0, true
      elsif alphanumeric
        if LETTERS.include?(ch)
          len += 1
          cnt_letters += 1
        elsif DIGITS.include?(ch)
          len += 1
          cnt_digits += 1
        else
          alphanumeric = false
        end
      end
    end
    max_len = [len, max_len].max if alphanumeric && cnt_letters.even? && cnt_digits.odd?
    max_len
  end

  def solution(s)
    len, cnt_letters, cnt_digits, alphanumeric, max_len = 0, 0, 0, true, -1
    s.each_byte do |ord|
      if ord == 32
        max_len = [len, max_len].max if alphanumeric && cnt_letters.even? && cnt_digits.odd?
        len, cnt_letters, cnt_digits, alphanumeric = 0, 0, 0, true
      elsif alphanumeric
        if (65..90).include?(ord) || (97..122).include?(ord)
          len += 1
          cnt_letters += 1
        elsif (48..57).include?(ord)
          len += 1
          cnt_digits += 1
        else
          alphanumeric = false
        end
      end
    end
    max_len = [len, max_len].max if alphanumeric && cnt_letters.even? && cnt_digits.odd?
    max_len
  end

  it { expect(solution('test 5 a0A pass007 ?xy1')).to eq(7) }
  it { expect(solution('-')).to eq(-1) }
  it { expect(solution('test')).to eq(-1) }
  it { expect(solution('test1')).to eq(5) }
  it { expect(solution('9999 999 00 0')).to eq(3) }
end
