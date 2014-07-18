require 'spec_helper'

describe OmniauthCallbacksController do

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

end
