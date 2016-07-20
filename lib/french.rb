require 'helpers'

class French
  extend Helpers

  def self.negate_verb(verb)
    if verb =~ /^[aàeèéiouù]/
      "n'#{verb} pas"
    else
      "ne #{verb} pas"
    end
  end

  def self.question_is_it_that(statement)
    statement = uncapitalize(statement)
    statement = chomp_punctuation(statement)
    "Est-ce que #{statement} ?"
  end

end
