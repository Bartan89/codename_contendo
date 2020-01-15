class Icon < ApplicationRecord
  has_many :picks

   validate :json_string_must_start_with
   validate :json_string_must_end_with

  def json_string_must_start_with
    if !json.starts_with? '{'
      errors.add(:json, "error. A json string should start with '{'.")
    end
  end

    def json_string_must_end_with
    if !json.ends_with? '}'
      errors.add(:json, "error. A json string should end with '}'.")
    end
  end

end
