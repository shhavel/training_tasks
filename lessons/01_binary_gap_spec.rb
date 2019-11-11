# frozen_string_literal: true

describe 'solution' do
  def solution(n)
    max_gap     = 0
    current_gap = 0
    one_met     = false
    n.to_s(2).each_char do |digit|
      if digit == '0'
        current_gap += 1 if one_met
      else # d == '1'
        one_met = true
        max_gap = [max_gap, current_gap].max
        current_gap = 0
      end
    end
    max_gap
  end

  context 'example1' do
    it { expect(solution(1041)).to eq 5 }
  end

  context 'example2' do
    it { expect(solution(15)).to eq 0 }
  end

  context 'extremes' do
    it { expect(solution(1)).to eq 0 }
    it { expect(solution(5)).to eq 1 }
    it { expect(solution(2_147_483_647)).to eq 0 }
  end

  context 'trailing_zeroes' do
    it { expect(solution(6)).to eq 0 }
    it { expect(solution(328)).to eq 2 }
  end

  context 'power_of_2' do
    it { expect(solution(16)).to eq 0 }
    it { expect(solution(1024)).to eq 0 }
  end

  context 'simple1' do
    it { expect(solution(9)).to eq 2 }
    it { expect(solution(11)).to eq 1 }
  end

  context 'simple2' do
    it { expect(solution(19)).to eq 2 }
    it { expect(solution(42)).to eq 1 }
  end

  context 'simple3' do
    it { expect(solution(1162)).to eq 3 }
    it { expect(solution(5)).to eq 1 }
  end

  context 'medium1' do
    it { expect(solution(51_712)).to eq 2 }
    it { expect(solution(20)).to eq 1 }
  end

  context 'medium2' do
    it { expect(solution(561_892)).to eq 3 }
    it { expect(solution(9)).to eq 2 }
  end

  context 'medium3' do
    it { expect(solution(66_561)).to eq 9 }
  end

  context 'large1' do
    it { expect(solution(6_291_457)).to eq 20 }
  end

  context 'large2' do
    it { expect(solution(74_901_729)).to eq 4 }
  end

  context 'large3' do
    it { expect(solution(805_306_369)).to eq 27 }
  end

  context 'large4' do
    it { expect(solution(1_376_796_946)).to eq 5 }
  end

  context 'large5' do
    it { expect(solution(1_073_741_825)).to eq 29 }
  end

  context 'large6' do
    it { expect(solution(1_610_612_737)).to eq 28 }
  end
end
