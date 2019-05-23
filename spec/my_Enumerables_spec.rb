require './lib/my_Enumerable'
RSpec.describe Enumerable do
  describe "#my_each" do
    it "returns an array with the values affected by a block of code" do
      array = [1, 2, 3, 4, 5]
      expect(array.my_each {|i| i }).to eql(array)
    end
  end
  
  describe "#my_each_with_index" do
    it "Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each(). If no block is given, an enumerator is returned instead." do
      result = Array.new
      array = [1,2,3,4,5]
      array.my_each_with_index {|i, index| result << i; result << index}
      expect(result).to eq([1, 0, 2, 1, 3, 2, 4, 3, 5, 4])
    end
    it "Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each(). If no block is given, an enumerator is returned instead." do
      result = Hash.new
      ["dog", "cat", "elephant"].my_each_with_index {|i, index| result[i] = index }
      expect(result).to eq({"dog" => 0, "cat" => 1, "elephant" => 2 })
    end
  end
  
  describe "#my_any" do
      it "checks if any form set_1 are included in set_2" do
          set_1 = [1,2,43,54,6]
          set_2 = [6,77,11]
          expect(set_1.any?{|i| set_2.include? i}).to be true
      end
      it "checks if any form set_1 are included in set_2" do
        set_1 = [1,2,43,54,6]
        set_2 = [4,22,11]
        expect(set_1.any?{|i| set_2.include? i}).to be false
    end
  end

  describe "#my_select" do
    it "goes through each element and selects elements that fulfill the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_select{ |i| i > 2}
        expect(answer).to eq([3,4])
    end

    it "returns empty array if all elements do not fulfill the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_select { |i| i < 0 }
        expect(answer).to eq([])
    end
  end
  describe "#my_count" do
    it "returns a count of how many elements fulfill the block condition" do
      example_array = [1,2,3,4]
      answer = example_array.my_count { |i| i > 2 }
      expect(answer).to eq(2)
    end
    it "returns a count of how many elements fulfill the block condition" do
      example_array = [22,8,324,1]
      answer = example_array.my_count { |i| i % 2 == 0 }
      expect(answer).to eq(3)
    end
  end
  describe "#my_map" do
    it "returns a new array with the elements modified by the block" do
      example_array = [1,2,3,4]
      answer = example_array.my_map { |i| i * 4 }
      expect(answer).to eq([4, 8, 12, 16])
    end
    it "returns a new array with the elements modified by the block" do
      example_array = [4,8,12,16]
      answer = example_array.my_map { |i| i / 4 }
      expect(answer).to eq([1, 2, 3, 4])
    end
  end
  describe "#my_all?" do
    it "returns true if all elements in an array fulfill the block condition" do
      example_array = [1,2,3,4]
      answer = example_array.my_all? { |i| i < 5 }
      expect(answer).to eq true
    end

    it "returns false if one of the elements does not fulsill the block condition" do
      example_array = [1,2,3,4]
      answer = example_array.my_all? { |i| i != 2 }
      expect(answer).to eq false
    end
  end 
  describe "#my_none?" do
    it "returns true if none of the elements fulfill the block condition" do
      example_array = [1,2,3,4]
      answer = example_array.my_none? { |i| i == 100 }
      expect(answer).to be true
    end

    it "returns false if one of the elements fulfill the block condition" do
      example_array = [1,2,3,4]
      answer = example_array.my_none? { |i| i == 4 }
      expect(answer).to be false
    end
  end  
  describe "#my_inject" do
    it "takes a parameter and yields to the block and returns the modified parameter" do
      example_array = [1,2,3,4]
      answer = example_array.my_inject(0) { |sum, i| sum = sum + i }
      expect(answer).to eq(10)
    end
    it "takes a parameter and yields to the block and returns the modified parameter" do
      example_array = [1,2,3,4]
      answer = example_array.my_inject(0) { |sum, i| sum = sum + i }
      expect(answer).to eq(10)
    end
  end 
end