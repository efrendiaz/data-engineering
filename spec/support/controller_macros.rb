module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]

      user = create_user
            user.confirm! # or set a confirmed_at inside the
      # factory. Only necessary if you are using the confirmable
# module
      sign_in user
    end
  end

  def create_user
    u = User.new
    u.email = "test@test.com"
    u.identity_url = "http://test.com"
    u
  end
end
