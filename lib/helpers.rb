module Helpers

  def chomp_punctuation(input)
    input.sub(/[[:punct:]]*$/, '')
  end

  def uncapitalize(input)
    input[0].downcase + input[1..-1]
  end

end
