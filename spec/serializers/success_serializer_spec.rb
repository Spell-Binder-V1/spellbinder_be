require "rails_helper"

RSpec.describe SuccessSerializer do
  describe '.serialize' do
    it 'serializes a success object' do
      success = "This is a successful result"
      serialized_success = SuccessSerializer.serialize(success)

      expect(serialized_success).to eq(
        {
          "success": [
            {
              "detail": success
            }
          ]
        }
      )
    end
  end
end