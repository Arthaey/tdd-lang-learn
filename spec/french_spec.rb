RSpec.describe French do

  context "when negating verbs" do
    it "should surround the conjugated verb with <ne __ pas>" do
      expect(French.negate_verb("parle")).to eq("ne parle pas")
    end

    it "should contract <ne> before vowel-initial verbs" do
      expect(French.negate_verb("est")).to eq("n'est pas")
    end
  end

end
