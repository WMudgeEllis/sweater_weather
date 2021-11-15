class ErrorSerializer

  def self.password_mismatch
    {
      errors: ['the passwords do not match']
    }
  end

  def self.general(errors)
    {
      errors: errors
    }
  end
end
