# frozen_string_literal: true

describe 'solution' do
  def solution(kapacity, clean, dirty)
    socks = clean.map { |color| [color, :clean] }.concat(dirty.map { |color| [color, :dirty] }).sort!

    pair_cnt = 0
    half_clean_pair_cnt = 0
    dirty_pair_cnt = 0

    prev_color, prev_state = nil, nil
    socks.each do |(color, state)|
      if !prev_color || prev_color != color
        prev_color, prev_state = color, state
      else # prev_color == color
        if prev_state == :clean && state == :clean
          pair_cnt += 1
        elsif prev_state == :clean || state == :clean
          half_clean_pair_cnt += 1
        else
          dirty_pair_cnt += 1
        end
        prev_color, prev_state = nil, nil
      end
    end

    return pair_cnt + kapacity if kapacity <= half_clean_pair_cnt
    kapacity -= half_clean_pair_cnt
    pair_cnt += half_clean_pair_cnt

    kapacity /= 2
    return pair_cnt + kapacity if kapacity <= dirty_pair_cnt
    # kapacity -= dirty_pair_cnt
    pair_cnt += dirty_pair_cnt

    pair_cnt
  end

  it { expect(solution(2, [1, 2, 1, 1], [1, 4, 3, 2, 4])).to eq(3) }
end
