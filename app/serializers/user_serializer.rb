class UserSerializer
  def self.new_user(user, key)
    {
      data: {
        type: 'users',
        id: user.id.to_s,
        attributes: {
          email: user.email,
          api_key: key.key
        }
      }
    }
  end
end
