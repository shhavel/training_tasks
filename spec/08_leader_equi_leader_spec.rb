# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    len = a.length
    return 0 if len < 2
    lead = a.sort[len / 2]
    cnt_all = a.count { |x| x == lead }
    return 0 if cnt_all <= len / 2
    cnt_left, cnt_right = 0, cnt_all
    len_left, len_right = 0, len
    res = 0
    (0...len).each do |i|
      len_left += 1
      len_right -= 1
      if a[i] == lead
        cnt_left += 1
        cnt_right -= 1
      end
      res += 1 if cnt_left > len_left / 2 && cnt_right > len_right / 2
    end
    res
  end

  it { expect(solution([4, 3, 4, 4, 4, 2])).to eq(2) }
end
