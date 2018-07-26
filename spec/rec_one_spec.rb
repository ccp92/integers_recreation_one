# frozen_string_literal: true

require 'rec_one'

describe RecreationOne do
  let(:recreation) { RecreationOne.new }

  result1 = [1, 1]
  result42 = [42, 2500]
  result246 = [246, 84_100]
  result287 = [287, 84100]
  result728 = [728, 722500]
  result1434 = [1434, 2856100]
  result1673 = [1673, 2856100]
  result1880 = [1880, 4884100]
  result4264 = [4264, 24304900]
  result6237 = [6237, 45024100]
  result9799 = [9799, 96079204]
  result9855 = [9855, 113635600]

  context 'given two arguments that are the same' do
    it 'can pass 1 and return [1, 1]' do
      test(1, 1, [result1])
    end

    it 'can pass 2 and return nill' do
      test(2, 2, [])
    end

    it 'can pass 42 and return [42, 2500]' do
      test(42, 42, [result42])
    end
  end

  context 'given two different arguments' do
    context 'whilst the arguments are valid (1 <= m <= n)' do
      it 'can pass 1 and 41 and return [1, 1]' do
        test(1, 41, [result1])
      end

      it 'can pass 41 and 42 and return [42, 2500]' do
        test(41, 42, [result42])
      end

      it 'can pass 1 and 42 and return [[1, 1], [42, 2500]]' do
        test(1, 42, [result1, result42])
      end

      it 'can pass 1 and 250 and return [[1, 1], [42, 2500], [246, 84100]]' do
        test(1, 250, [result1, result42, result246])
      end

      it 'can pass 1 and 10,000 and return a valid array' do
        test(1, 10_000, [result1, result42, result246, result287, result728, result1434, result1673, result1880, result4264, result6237, result9799, result9855])
      end
    end

    context 'whilst the arguments are invalid' do
      it 'raises an error when m > n' do
        expect { recreation.list_squared(2, 1) }.to raise_error(ArgumentError)
      end

      it 'raises an error when 1 > m' do
        expect { recreation.list_squared(0, 3) }.to raise_error(ArgumentError)
      end

      it 'raises an error when m is not an Integer' do
        expect { recreation.list_squared(2.5, 3) }.to raise_error(ArgumentError)
      end

      it 'raises an error when 1 > n' do
        expect { recreation.list_squared(0, 0) }.to raise_error(ArgumentError)
      end

      it 'raises an error when n is not an Integer' do
        expect { recreation.list_squared(1, 3.25) }.to raise_error(ArgumentError)
      end
    end
  end

  private

  def test(first_number, last_number, output)
    expect(recreation.list_squared(first_number, last_number)).to eq(output)
  end
end
