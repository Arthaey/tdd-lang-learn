class French

  def self.negate_verb(verb)
    if verb =~ /^[aàeèéiouù]/
      "n'#{verb} pas"
    else
      "ne #{verb} pas"
    end
  end

  def self.question_is_it_that(statement)
    sentence = Sentence.new(statement)
    "Est-ce que #{sentence.deformatted} ?"
  end

  def self.inverted_question(statement)
    sentence = Sentence.new(statement)

    # TODO: implement
    sentence.deformatted.capitalize
  end

end
