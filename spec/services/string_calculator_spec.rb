require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns a number if only one given" do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "handles newlines between numbers" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiter" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect {
        StringCalculator.add("1,-2,-4")
      }.to raise_error("negative numbers not allowed: -2, -4")
    end
  end
end
