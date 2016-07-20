class French

  def self.negate_verb(verb)
    if verb =~ /^[aàeèéiouù]/
      "n'#{verb} pas"
    else
      "ne #{verb} pas"
    end
  end

end
