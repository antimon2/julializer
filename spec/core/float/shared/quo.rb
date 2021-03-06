shared_examples :float_quo, shared: true do |method|
  it "performs floating-point division between self and a Fixnum" do
    "8.9.send(:#{method}, 7)".should be_equivalent_to "1.2714285714285716"
  end

  xit "performs floating-point division between self and a Bignum" do
    "8.9.send(:#{method}, 9999999999999**9)".should be_equivalent_to "8.900000000008011e-117"
  end

  it "performs floating-point division between self and a Float" do
    "2827.22.send(:#{method}, 872.111111)".should be_equivalent_to "3.2418116961704433"
  end

  it "returns NaN when the argument is NaN" do
    "-1819.999999.send(:#{method}, Float::NAN).nan?".should be_equivalent_to "true"
    "11109.1981271.send(:#{method}, Float::NAN).nan?".should be_equivalent_to "true"
  end

  it "returns Infinity when the argument is 0.0" do
    "2827.22.send(:#{method}, 0.0).infinite?".should be_equivalent_to "true"
  end

  it "returns -Infinity when the argument is 0.0 and self is negative" do
    "-48229.282.send(:#{method}, 0.0).infinite?".should be_equivalent_to "true"
  end

  it "returns Infinity when the argument is 0" do
    "2827.22.send(:#{method}, 0).infinite?".should be_equivalent_to "true"
  end

  it "returns -Infinity when the argument is 0 and self is negative" do
    "-48229.282.send(:#{method}, 0).infinite?".should be_equivalent_to "true"
  end

  it "returns 0.0 when the argument is Infinity" do
    "47292.2821.send(:#{method}, Float::INFINITY)".should be_equivalent_to "0.0"
  end

  it "returns -0.0 when the argument is -Infinity" do
    "1.9999918.send(:#{method}, -Float::INFINITY)".should be_equivalent_to "-0.0"
  end

  xit "performs floating-point division between self and a Rational" do
    "74620.09.send(:#{method}, Rational(2,3))".should be_equivalent_to "111930.135"
  end

  xit "performs floating-point division between self and a Complex" do
    "74620.09.send(:#{method}, Complex(8,2))".should be_equivalent_to "Complex(8778.834117647059, -2194.7085294117646)"
  end

  xit "raises a TypeError when argument isn't numeric" do
    lambda { 27292.2.send(@method, mock('non-numeric')) }.should raise_error(TypeError)
  end

  xit "raises an ArgumentError when passed multiple arguments" do
    lambda { 272.221.send(@method, 6,0.2) }.should raise_error(ArgumentError)
  end
end
