require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#<" do
  it "returns true if self is less than other" do
    "(71.3 < 91.8)".should be_equivalent_to "true"
    "(192.6 < -500)".should be_equivalent_to "false"
    "(-0.12 < 0x4fffffff)".should be_equivalent_to "true"
  end

  xit "raises an ArgumentError when given a non-Numeric" do
    lambda { 5.0 < "4"       }.should raise_error(ArgumentError)
    lambda { 5.0 < mock('x') }.should raise_error(ArgumentError)
  end
end
