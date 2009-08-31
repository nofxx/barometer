require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Query::Postalcode" do

  before(:each) do
    @valid = "T5B 4M9"
    @invalid = "90210"
  end

  describe "and class methods" do

    it "returns a format" do
      Query::Format::Postalcode.format.should == :postalcode
    end

    it "returns a country" do
      Query::Format::Postalcode.country_code.should == "CA"
      Query::Format::Postalcode.country_code("ignored").should == "CA"
    end

    it "returns a regex" do
      Query::Format::Postalcode.regex.should_not be_nil
      Query::Format::Postalcode.regex.is_a?(Regexp).should be_true
    end

    it "returns the convertable_formats" do
      Query::Format::Postalcode.convertable_formats.should_not be_nil
      Query::Format::Postalcode.convertable_formats.is_a?(Array).should be_true
      Query::Format::Postalcode.convertable_formats.should == []
    end

    describe "is?," do

      it "recognizes a valid format" do
        Query::Format::Postalcode.is?(@valid).should be_true
      end

      it "recognizes non-valid format" do
        Query::Format::Postalcode.is?(@invalid).should be_false
      end

    end

    it "stubs to" do
      Query::Format::Postalcode.to.should be_nil
    end

    it "stubs convertable_formats" do
      Query::Format::Postalcode.convertable_formats.should == []
    end

    it "doesn't convert" do
      query = Barometer::Query.new(@valid)
      Query::Format::Postalcode.converts?(query).should be_false
    end

  end

end
