RSpec.describe Helpers do
  include Helpers

  it "should strip trailing punctuation" do
    expect(chomp_punctuation("foo")).to eq("foo")
    expect(chomp_punctuation("foo.")).to eq("foo")
    expect(chomp_punctuation("foo?!")).to eq("foo")
  end

  it "should uncapitalize the first word" do
    expect(uncapitalize("Foo")).to eq("foo")
    expect(uncapitalize("FOO")).to eq("fOO")
    expect(uncapitalize("foo")).to eq("foo")
  end

end
