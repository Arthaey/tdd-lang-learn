RSpec.describe Sentence do

  subject(:sentence) { Sentence.new("Hello, world.") }

  subject(:swappable) {
    Sentence.new("Hello, world.", {greeting: "hello", addressee: "world"})
  }

  it "should save the original text" do
    expect(sentence.to_s).to eq("Hello, world.")
  end

  it "#deformatted should remove formatting" do
    expect(sentence.deformatted).to eq("hello, world")
  end

  context "with defined parts" do
    it "should create parts via the initializer" do
      expect(swappable[:greeting]).to eq("hello")
    end

    it "should create parts after initialization" do
      sentence.define!(:greeting, "hello")
      expect(sentence[:greeting]).to eq("hello")
    end

    it "should fail to create parts that don't exist in the text" do
      expect {
        swappable.define!(:non_matching_part, "404")
      }.to raise_error("'404' is not part of 'Hello, world.'")
    end

    it "#swap should exchange parts of the text" do
      expect(swappable.swap(:greeting, :addressee)).to eq("World, hello.")
      expect(swappable.swap(:addressee, :greeting)).to eq("World, hello.")
      expect(swappable.to_s).to eq("Hello, world.")
    end

    it "#swap should fail with undefined parts" do
      expect {
        swappable.swap(:non_existent_part, :other_part)
      }.to raise_error("':non_existent_part' is not a defined part")
    end
  end

  context "allows chaining methods" do
    it "with #deformatted" do
      expect(sentence.deformatted).to be_a(Sentence)
    end

    it "with #swap" do
      expect(swappable.swap(:greeting, :addressee)).to be_a(Sentence)
    end

    it "with duplicated parts" do
      new_swappable = swappable.swap(:greeting, :addressee)
      expect(swappable.parts).to eq(new_swappable.parts)
    end
  end

end

