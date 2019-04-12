# frozen_string_literal: true

# Generates a short uid field using the constants:
# - UID_ALPHABET = sequence of unique characters
# - UID_BOOSTER = integer
# - UID_PREFIX = prefix
module HasUid
  extend ActiveSupport::Concern

  included do
    # Intialize the UID and save the record
    def generate_uid
      if id && !uid
        uid = self.class.bijection_engine.encode(id)
        update_column(:uid, uid)
      end
      true
    end
  end

  module ClassMethods
    cattr_accessor :bijection_engine
    def set_uid_constants(uid_alphabet, uid_booster)
      self.bijection_engine = BijectionEngine.new(uid_alphabet, uid_booster)
    end
  end
end
