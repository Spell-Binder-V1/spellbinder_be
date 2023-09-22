require 'rails_helper'

RSpec.describe ErrorSerializer do
  describe '.serialize' do
    it 'serializes an error object' do
      error = "This is an error message"
      serialized_error = ErrorSerializer.serialize(error)

      expect(serialized_error).to eq(
        {
          "errors": [
            {
              "detail": error
            }
          ]
        }
      )
    end
  end
end