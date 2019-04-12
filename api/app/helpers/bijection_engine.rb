# frozen_string_literal: true
# Bijection function from the integer
# space to a given alphabet
# Useful to generate/decode a series of charaters
# from an id (slug generation typically)
class BijectionEngine
  attr_reader :alphabet, :booster

  # The alphabet is a series of characters
  # used to create the bijection
  # E.g: "wrdcuyjpbiflaqzesgmhvtknxo"
  # ---
  # The booster is used to avoid generating
  # sequences that are too short
  # E.g: If booster is zero then
  # encoding an id close to zero will produce
  # only one character. If you want a minimum
  # of three then you should set your booster
  # to ~1000 (depending on your alphabet)
  def initialize(alphabet, booster = 0)
    raise ArgumentError, "You must provide an alphabet" if alphabet.blank?
    @alphabet = alphabet
    @booster = booster
  end

  # Transform an integer into a unique
  # string using the engine alphabet
  # and booster
  def encode(number)
    i = number + @booster
    return @alphabet[0] if i == 0
    s = StringIO.new
    base = @alphabet.length
    while i > 0
      s << @alphabet[i.modulo(base)]
      i /= base
    end
    s.string.reverse
  end

  # Transform a string into a number
  # using the engine alphabet
  # and booster
  def decode(sentence)
    i = 0
    base = @alphabet.length
    sentence.each_char { |c| i = i * base + @alphabet.index(c) }
    i - @booster
  end
end
