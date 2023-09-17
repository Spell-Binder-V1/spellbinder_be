class SuccessSerializer
  def self.serialize(success)
    {
      "success": [
        {
          "detail": success
        }
      ]
    }
  end
end