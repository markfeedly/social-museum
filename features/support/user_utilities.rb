Before do
  @session = SocMusTestSession.new
end

module UserUtilities
  def session
    @session
  end

  def user_data
    @session.user_data
  end

  def default_user_name
    @session.default_user_name
  end

  def create_user_data(user_name=default_user_name)
    @session.create_user_data(user_name)
  end

  def user_exists?(user_name=current_user)
    user_data.any?{|_, data| data[:name] == user_name}
  end

  def merge_into_user_data(merge_data, user_name=default_user_name)
    user_data[user_name].merge!(merge_data)
  end

  def user_email(user_name=current_user)
    user_data[user_name].try(:[], :email)
  end

  def default_user
    user_data['Testy McUserton']
  end

  def all_user_emails
    user_data.collect{|_, data| data[:email] }
  end

  def create_user(user_name=current_user)
    sign_up(user_name)
    confirm_via_emailed_link
  end

  def delete_user(user_name=current_user)
    if user_data[user_name]
      u = User.where(email: user_data[user_name][:email]).first
      u.destroy unless u.nil?
    end
  end

  def sign_up(user_name=default_user_name)
    delete_user(user_name)
    create_user_data(user_name)

    visit new_user_registration_path
    fill_in "Name",                       :with => user_data[user_name][:name]
    fill_in "Email",                      :with => user_data[user_name][:email]
    fill_in "user_password",              :with => user_data[user_name][:password]
    fill_in "user_password_confirmation", :with => user_data[user_name][:password_confirmation]
    click_button "Sign up"
  end

  def confirm_via_emailed_link
    open_last_email
    click_email_link_matching /confirm/
  end

  def current_user
    @session.current_user
  end

  def current_user=(new_user)
    @session.current_user = new_user
  end

  def sign_in(user_name=default_user_name)
    sign_out
    visit new_user_session_path

    fill_in "Email",    :with => user_data[user_name][:email]
    fill_in "Password", :with => user_data[user_name][:password]
    click_button "Sign in"
    self.current_user = user_name
  end

  def sign_out
    self.current_user = nil
    visit root_path
    if page.has_css?("[data-role='sign-out']")
      find(:css, "[data-role='sign-out']").click
    end
  end

  def as_admin(&blk)
    user = User.find_by_email(user_email)
    user.admin = true
    user.save!
    blk.call
    user.admin = false
    user.save!
  end
end

class SocMusTestSession
  def current_user
    if defined?(@current_user)
      @current_user
    else
      @current_user = default_user_name
    end
  end

  def current_user=(new_user)
    @current_user = new_user
  end

  def default_user_name
    "Testy McUserton"
  end

  def default_user
    user_data[default_user_name] || create_user_data(default_user_name)
  end

  def create_user_data(user_name=default_user_name)
    user_data[user_name] ||= {:name => user_name,
                              :email => "#{user_name.downcase.gsub(/ /,'.')}@example.com",
                              :password => "changeme",
                              :password_confirmation => "changeme"}
  end

  def user_data
    @user_data ||= {}
  end
end

World(UserUtilities)