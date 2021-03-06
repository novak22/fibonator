# frozen_string_literal: true

require_relative '../lib/fibonator'

RSpec.describe Fibonator do

  it 'has a version number' do
    expect(Fibonator::VERSION).not_to be nil
  end

  it 'raises error on invalid argument' do
    expect { subject.nth_element('s') }.to raise_error(ArgumentError, 'Only numbers are allowed')
    expect { subject.nth_element(Integer) }.to raise_error(ArgumentError, 'Only numbers are allowed')
    expect { subject.nth_element([3]) }.to raise_error(ArgumentError, 'Only numbers are allowed')
  end

  it 'accepts integer as a string' do
    expect(subject.nth_element('3')).to eq(2)
    expect(subject.nth_element('42')).to eq(267_914_296)
  end


  it 'nth element is 0' do
    expect(subject.nth_element(0)).to eq(0)
  end

  it 'nth element is 1' do
    expect(subject.nth_element(1)).to eq(1)
  end

  it 'nth element is 2' do
    expect(subject.nth_element(2)).to eq(1)
  end

  it 'nth element is small number' do
    expect(subject.nth_element(3)).to eq(2)
    expect(subject.nth_element(4)).to eq(3)
    expect(subject.nth_element(5)).to eq(5)
    expect(subject.nth_element(6)).to eq(8)
    expect(subject.nth_element(7)).to eq(13)
    expect(subject.nth_element(8)).to eq(21)
    expect(subject.nth_element(9)).to eq(34)
  end

  it 'nth element is medium number' do
    expect(subject.nth_element(16)).to eq(987)
    expect(subject.nth_element(27)).to eq(196418)
    expect(subject.nth_element(32)).to eq(2178309)
    expect(subject.nth_element(37)).to eq(24157817)
  end

  it 'nth element is 42' do
    expect(subject.nth_element(42)).to eq(267914296)
  end

  it 'nth element is 45' do
    expect(subject.nth_element(45)).to eq(1134903170)
  end

  it 'nth element is 1000' do
    expect(subject.nth_element(1000).to_s.length).to eq(209)
  end



  describe 'big numbers' do
    before { skip if described_class.soft_limit < 1000781 }

    it 'nth element is 10078' do
      expect(subject.nth_element(10078).to_s.length).to eq(2106)
    end

    it 'nth element is 100078' do
      expect(subject.nth_element(100078).to_s.length).to eq(20915)
    end

    it 'nth element is 1000781' do
      expect(subject.nth_element(1000781).to_s.length).to eq(209151)
    end
  end


  describe 'calculator limits' do
    let(:over_soft_limit_message){/Number too big/}
    context 'matrix' do
      let(:calculator){ :matrix }
      it 'numbers >11000' do
        expect { subject.nth_element(11001, calculator: calculator) }.not_to raise_error
      end
      it 'numbers >10_000_000' do
        expect { subject.nth_element(1_000_000, calculator: calculator) }.not_to raise_error
        expect { subject.nth_element(10_000_001, calculator: calculator) }.to raise_error(ArgumentError, over_soft_limit_message)
      end
    end

    context 'recursive' do
      it 'numbers >1100' do
        expect { subject.nth_element(1101, calculator: :recursive) }.not_to raise_error
      end

      it 'numbers >11000' do
        expect { subject.nth_element(11001, calculator: :recursive) }.to raise_error(ArgumentError, over_soft_limit_message)
      end
    end

    context 'soft limits' do
      let(:soft_limit) { described_class.soft_limit }

      it 'raises argument error if over the limit' do
        expect { subject.nth_element(soft_limit + 1) }.to raise_error(ArgumentError, over_soft_limit_message)
        expect { subject.nth_element(10_000, soft_limit: 9_000) }.to raise_error(ArgumentError, over_soft_limit_message)
        expect { subject.nth_element(soft_limit + 10_000) }.to raise_error(ArgumentError, over_soft_limit_message)
      end
    end

    context 'soft limits rewrite' do
      context 'recursive' do
        let(:calculation_method){:recursive}
        let(:soft_limit){subject.soft_limit(calculation_method)}

        it 'overwrites soft limit' do
          expect { subject.nth_element(soft_limit + 1, calculator: :recursive) }.to raise_error(ArgumentError, over_soft_limit_message)
          expect { subject.nth_element(soft_limit + 1, calculator: :recursive, soft_limit: 0) }.not_to raise_error(ArgumentError, over_soft_limit_message)
        end
      end
    end

  end

end
