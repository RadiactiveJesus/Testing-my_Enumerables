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
        array.my_each_with_index {|element, index| result << element; result << index }
			  expect(result).to eq([1,0,2,1,3,2,4,3,5,4])
      end
    end
    
    describe "#my_any" do
        it "checks if any form set_1 are included in set_2" do
            set_1 = [1,2,43,54,6]
            set_2 = [6,77,11]
            expect(set_1.any?{|i| set_2.include? i}).to be true
        end
    end

    describe "#my_select" do
        it "goes through each element and selects elements that meet the block condition" do
            example_array = [1,2,3,4]
			      answer = [1,'a', 2, 'dog', 'cat', 5, 6].my_select{ |x| x.class===String}.join(", ")
			      expect(answer).to eq(['a','dog','cat'])
		    end

        it "returns empty array if all elements do not meet the block condition" do
            example_array = [1,2,3,4]
			      answer = example_array.my_select { |element| element > 2 }
			      expect(answer).to eq([])
        end
    end
    describe "#my_count" do
      it "returns a count of how many elements meet the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_count { |element| element > 2 }
        expect(answer).to eq(2)
      end
    end
    describe "#my_map" do
      it "returns a new array with the elements modified by the block" do
        example_array = [1,2,3,4]
        answer = example_array.my_map { |element| element * 4 }
        expect(answer).to eq([4, 8, 12, 16])
      end
    end
    describe "#my_all?" do
      it "returns true if all elements meet the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_all? { |element| element < 5 }
        expect(answer).to be true
      end
  
      it "returns false if one of the elements does not meet the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_all? { |element| element != 2 }
        expect(answer).to be false
      end
    end 
    describe "#my_none?" do
      it "returns true if none of the elements meet the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_none? { |element| element == 100 }
        expect(answer).to be true
      end
  
      it "returns false if one of the elements meet the block condition" do
        example_array = [1,2,3,4]
        answer = example_array.my_none? { |element| element == 4 }
        expect(answer).to be false
      end
    end  
    describe "#my_inject" do
      it "takes a parameter and yields to the block and returns the modified parameter" do
        example_array = [1,2,3,4]
        answer = example_array.my_inject(0) { |sum, element| sum = sum + element }
        expect(answer).to eq(10)
      end
    end 
end