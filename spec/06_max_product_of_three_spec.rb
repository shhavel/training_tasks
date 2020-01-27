# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    positeves, negatives_and_zeros = a.partition { |x| x > 0 }
    zeros, negatives = negatives_and_zeros.partition(&:zero?)

    m, n = negatives.min(2)
    p, q, r = positeves.max(3)

    if positeves.size >= 3 # >= 3 positeves
      if negatives.size >= 2
        [m * n, r * q].max * p
      else # only one negative
        p * q * r
      end
    elsif positeves.size >= 1 # 1-2 positeves
      if negatives.size >= 2
        m * n * p
      elsif zeros.any? # 1-2 positeves, 0-1 negatives
        0
      else # 2 positeves, 1 negatives (3-element array)
        p * q * m
      end
    else # no positives
      if zeros.any?
        0
      else
        k, j, i = negatives.max(3)
        k * j * i
      end
    end
  end

  it { expect(solution([-3, 1, 2, -2, 5, 6])).to eql(60) }
  it { expect(solution([5, -4, -4])).to eql(80) }
  it { expect(solution([5, 4, -4])).to eql(-80) }
  it { expect(solution([-1, 0, 1])).to eql(0) }
  it { expect(solution([-1, 0, 1, 1])).to eql(0) }
  it { expect(solution([-1, -1, 0, 1, 1])).to eql(1) }
  it { expect(solution([-6, -5, -4, -3, -2, -1])).to eql(-6) }
  it { expect(solution((-1000..1000).to_a)).to eql(999_000_000) }
  it { expect(solution((-10..10).to_a * 2000 + [-1000, 500, -1])).to eql(5_000_000) }
end
