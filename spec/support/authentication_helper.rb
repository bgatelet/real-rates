module AuthenticationHelper
  def sign_in(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers['Authorization'] = "Bearer #{token}"
  end
end
