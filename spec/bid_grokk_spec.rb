require "rspec"

require 'spec_helper'

describe BidGrokk do

  before :each do
    @bid_grokk = BidGrokk.new
  end

  # sanity check
  describe "#new" do
    it "takes no parameters and returns a BidGrokk object" do
      @bid_grokk.should be_an_instance_of BidGrokk
    end
  end

  # boundary conditions...values are assurred to be postiive integers
  it "should find best bid of 0, 0 given 0, []" do
    @bid_grokk.find_max_area(0, []).should eql [0, 0]
  end

  it "should find best bid of 0, 0 given 3, []" do
    @bid_grokk.find_max_area(3, []).should eql [0, 0]
  end

  it "should find best bid of 0, 0 given 0, [3,2,1]" do
    @bid_grokk.find_max_area(0, [3,2,1]).should eql [0, 0]
  end

  # correctness tests
  it "should find best bid of 7, 14" do
    @bid_grokk.find_max_area(3, [7]).should eql [7, 7]
  end

  it "should find best bid of 7, 14" do
    @bid_grokk.find_max_area(3, [7,7,3,2,1,1]).should eql [7, 14]
  end

  it "should find best bid of 7, 14" do
    @bid_grokk.find_max_area(17, [7,7,3,2,1,1]).should eql [7, 14]
  end

  it "should find best bid of 7, 7" do
    @bid_grokk.find_max_area(3, [7,3,2,1,1,1,1,1]).should eql [7, 7]
  end

  it "should find best bid of 1, 8" do
    @bid_grokk.find_max_area(8, [7,3,2,1,1,1,1,1]).should eql [1, 8]
  end

  it "should find best bid of 7, 7" do
    @bid_grokk.find_max_area(1, [7,3,2,1,1,1,1,1]).should eql [7, 7]
  end

end