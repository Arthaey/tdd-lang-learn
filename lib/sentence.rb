require_relative 'helpers'

class Sentence < String
  include Helpers

  attr_reader :parts

  def initialize(text, parts = {})
    super(text.to_s)
    @original_text = text

    @parts = {}
    parts.each { |k,v| define!(k, v) }
  end
  
  def deformatted
    new_text = chomp_punctuation(uncapitalize(@original_text))
    Sentence.new(new_text, @parts)
  end

  def [](part_name)
    @parts[part_name]
  end

  def define!(part_name, match_text)
    if @original_text !~ /#{Regexp.escape(match_text)}/i
      raise "'#{match_text}' is not part of '#{@original_text}'"
    end

    @parts[part_name] = match_text
  end

  def swap(part_a, part_b)
    if !@parts.has_key?(part_a)
      raise "'#{part_a.inspect}' is not a defined part"
    elsif !@parts.has_key?(part_b)
      raise "'#{part_b.inspect}' is not a defined part"
    end

    regex_a = /#{Regexp.escape(self[part_a])}/i
    regex_b = /#{Regexp.escape(self[part_b])}/i

    match_a = regex_a.match(@original_text)
    match_b = regex_b.match(@original_text)

    swapped_text = @original_text.sub(regex_a, "~PLACEHOLDER-B~")
    swapped_text = swapped_text.sub(regex_b, "~PLACEHOLDER-A~")
    swapped_text = swapped_text.sub("~PLACEHOLDER-B~", match_b[0])
    swapped_text = swapped_text.sub("~PLACEHOLDER-A~", match_a[0])

    Sentence.new(swapped_text.capitalize, @parts)
  end

end
