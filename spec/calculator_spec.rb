require_relative "../calculator"
require_relative "spec_helper"

describe Calculator do
  let(:calculator) {Calculator.new(1)}

  describe ".new" do
    it "create new calculator instance" do
      expect(calculator).to_not eq nil
    end
  end

  describe "#result" do
    it "returns result" do
      expect(calculator.result).to eq 1
    end
  end
e
  describe "#reset(x)" do
    it "change the result to x" do
      calculator.reset(3)
      expect(calculator.result).to eq 3
    end
  end

  describe "#add(x)" do
    it "adds x to the result" do
      calculator.add(101)
      expect(calculator.result).to eq 102
    end
    it "should return error" do
      expect { calculator.add("a string") }.to raise_error(StandardError)
    end
  end

  describe "#subtract(x)" do
    it "subtract x to result" do
      calculator.add(100)
      calculator.subtract(1)
      expect(calculator.result).to eq 100
    end
    it "should return error" do
      expect { calculator.subtract("a string") }.to raise_error(StandardError)
    end
  end
  #
  # describe "#multiply(x)" do
  #   it "multiply x to result" do
  #     calculator.multiply(3)
  #     expect(calculator.result).to eq 3
  #   end
  # end
  #
  # describe "#divide(x)" do
  #   it "divide x to result" do
  #     calculator.divide(1)
  #     expect(calculator.result).to eq 1
  #   end
  # end

  # describe "#add #subtract #divide #multiply non-integer (x)" do
  #   it "add(non-integer x) should raise error" do
  #     expect{ calculator.add("100") }.to raise_error(StandardError)
  #   end
  #   it "subtract(non-integer x) should raise error" do
  #     expect{ calculator.subtract("100") }.to raise_error(StandardError)
  #   end
  #   it "multiply(non-integer x) should raise error" do
  #     expect{ calculator.multiply("100") }.to raise_error(StandardError)
  #   end
  #   it "divide(non-integer x) should raise error" do
  #     expect{ calculator.divide("100") }.to raise_error(StandardError)
  #   end
  # end

  describe "chainable methods" do
    it "adds x and subtracts y in one line" do
      calculator.add(5).subtract(5)
      expect(calculator.result).to eq 1
    end
  end

  describe "#operation" do
    it "#operation('add', x) should add x" do
      calculator.operation('add', 30)
      expect(calculator.result).to eq 31
    end
    it "#operation('subtract', x) should subtract x" do
      calculator.operation('subtract', 1)
      expect(calculator.result).to eq 0
    end
    it "#operation('multiply', x) should multiply x" do
      calculator.operation('multiply', 30)
      expect(calculator.result).to eq 30
    end
    it "#operation('divide', x) should divide x" do
      calculator.operation('divide', 0.5)
      expect(calculator.result).to eq 2
    end
  end

  describe "#undo" do
    it "changes result to previous value" do
      calculator.operation('multiply', 50)
      calculator.undo
      expect(calculator.result).to eq 1
    end
  end

  describe "#redo" do
    it "changes result back to previously undone value" do
      calculator.operation('multiply', 50)
      calculator.undo
      calculator.redo
      expect(calculator.result).to eq 50
    end
  end
end
