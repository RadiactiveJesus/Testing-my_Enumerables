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
            result = Array.new
            array = [1,2,3,4]
			result = array.my_select{|value| value % 2 == 0 }
			expect(result).to eq([2,4])
		end

        it "returns empty array if all elements do not meet the block condition" do
            result = Array.new
            array = [1,2,3,4]
			result = array.my_select{|value| value > 4 }
			expect(result).to eq([])
		end
	end
    
end