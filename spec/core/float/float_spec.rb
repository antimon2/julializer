require File.expand_path('../../../spec_helper', __FILE__)

xdescribe "Float" do
  it "includes Comparable" do
    Float.include?(Comparable).should == true
  end
end
