# frozen_string_literal: true

require 'rec_one'

describe RecreationOne do
  let(:recreation) { RecreationOne.new }
  context 'given two arguments that are the same' do
    it 'can pass 1 and return the result of [1, 1]' do
      expect(recreation.list_squared(1, 1)).to eq([[1, 1]])
    end

    it 'can pass 2 and return nill' do
      expect(recreation.list_squared(2, 2)).to eq(nil)
    end

    it 'can pass 42 and return [42, 2500]' do
      expect(recreation.list_squared(42, 42)).to eq([[42, 2500]])
    end
  end

  context 'given two arguments' do
    it 'can pass 1 and 41 and return the results of [1, 1]' do
      expect(recreation.list_squared(1, 41)).to eq([[1, 1]])
    end

    it 'can pass 41 and 42 and return the results of [42, 2500]' do
      expect(recreation.list_squared(41, 42)).to eq([[42, 2500]])
    end

    it 'can pass 1 and 42 and return the results of [[1, 1], [42, 2500]]' do
      expect(recreation.list_squared(1, 42)).to eq([[1, 1], [42, 2500]])
    end

    it 'can pass 1 and 250 and return the results of [[1, 1], [42, 2500], [246, 84100]]' do
      expect(recreation.list_squared(1, 250)).to eq([[1, 1], [42, 2500], [246, 84100]])
    end
  end
end
