Then(/^I see the basic navigation menu$/) do
  within('.navbar') do
    page.should have_css("a[href='#{pages_path}']")
    page.should have_css("a[href='#{resources_path}']")
    page.should have_css("a[href='#{new_user_registration_path}']")
    page.should have_css("a[href='#{new_user_session_path}']")
  end
end

Then(/^I see the user navigation menu$/) do
  within('.navbar') do
    page.should have_css("a[href='#{pages_path}']")
    page.should have_css("a[href='#{resources_path}']")
    page.should have_css("a[href='#{new_page_path}']")
    # TODO Establish appropriate way to refer to profile/edit from route
    #page.should have_css("a[href='#{edit_user_path(User.find_by_email(user_email))}']")
    page.should have_css("a[href='/users/edit']")
    page.should have_css("a[href='#{destroy_user_session_path}']")
  end
end

Then(/^I see the admin navigation menu$/) do
  within('.navbar') do
    page.should have_css("a[href='#{pages_path}']")
    page.should have_css("a[href='#{resources_path}']")
    page.should have_css("a[href='#{new_page_path}']")
    page.should have_css("a[href='#{user_path}']")
    # TODO Establish appropriate way to refer to profile/edit from route
    #page.should have_css("a[href='#{edit_user_path(User.find_by_email(user_email))}']")
    page.should have_css("a[href='/users/edit']")
    page.should have_css("a[href='#{destroy_user_session_path}']")
  end
end