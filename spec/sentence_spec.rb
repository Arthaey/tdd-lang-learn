RSpec.describe Sentence do

  subject { Sentence.new("Hello, world.") }

  it "should save the original text" do
    expect(subject.to_s).to eq("Hello, world.")
  end

  it "#deformatted should remove formatting" do
    expect(subject.deformatted).to eq("hello, world")
  end

end

