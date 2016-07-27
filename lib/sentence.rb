require_relative 'helpers'

class Sentence < String
  include Helpers

  def initialize(text)
    @original_text = text
    super(@original_text.to_s)
  end
  
  def deformatted
    chomp_punctuation(uncapitalize(@original_text))
  end

end
