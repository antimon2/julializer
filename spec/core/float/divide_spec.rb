require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/coerce.rb', __FILE__)

describe "Float#/" do
  it "returns self divided by other" do
    "(5.75 / -2)".should be_equivalent_to "(-2.875)"
    "(451.0 / 9.3)".should be_equivalent_to "(48.494623655914)"
    "(91.1 / -0xffffffff)".should be_equivalent_to "(-2.12108716418061e-08)"
  end

  xit "properly coerces objects" do
    (5.0 / FloatSpecs::CanCoerce.new(5)).should be_close(0, TOLERANCE)
  end

  it "returns +Infinity when dividing non-zero by zero of the same sign" do
    "(1.0 / 0.0)".should be_equivalent_to "Float::INFINITY"
    "(-1.0 / -0.0)".should be_equivalent_to "Float::INFINITY"
  end

  it "returns -Infinity when dividing non-zero by zero of opposite sign" do
    "(-1.0 / 0.0)".should be_equivalent_to "-Float::INFINITY"
    "(1.0 / -0.0)".should be_equivalent_to "-Float::INFINITY"
  end

  it "returns NaN when dividing zero by zero" do
    "(0.0 / 0.0)".should be_equivalent_to "Float::NAN"
    "(-0.0 / 0.0)".should be_equivalent_to "Float::NAN"
    "(0.0 / -0.0)".should be_equivalent_to "Float::NAN"
    "(-0.0 / -0.0)".should be_equivalent_to "Float::NAN"
  end

  xit "raises a TypeError when given a non-Numeric" do
    lambda { 13.0 / "10"    }.should raise_error(TypeError)
    lambda { 13.0 / :symbol }.should raise_error(TypeError)
  end
end
