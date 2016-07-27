RSpec.describe French do

  context "when negating verbs" do
    it "should surround the conjugated verb with <ne __ pas>" do
      expect(French.negate_verb("parle")).to eq("ne parle pas")
    end

    it "should contract <ne> before vowel-initial verbs" do
      expect(French.negate_verb("est")).to eq("n'est pas")
    end
  end

  context "when forming simple questions" do
    it "should prefix <est-ce que> to a statement" do
      statement = "Vous parlez anglais."
      question = "Est-ce que vous parlez anglais ?"
      expect(French.question_is_it_that(statement)).to eq(question)
    end

    it "should join 2nd- or 3rd-person pronouns to the inverted verb" do
      statement = Sentence.new("Vous parlez anglais.", {pronoun: "vous", verb: "parlez"})
      question = "Parlez-vous anglais ?"
      expect(French.inverted_question(statement)).to eq(question)
    end
  end

end
