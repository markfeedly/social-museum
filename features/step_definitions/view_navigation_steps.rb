Then(/^I see the basic navigation menu$/) do
  within('.navbar') do
    expect(page).to have_css("a[href='#{pages_path}']")
    expect(page).to have_css("a[href='#{resources_path}']")
    expect(page).to have_css("a[href='#{recent_index_path}']")
    expect(page).to have_css("a[href='#{new_user_registration_path}']")
    expect(page).to have_css("a[href='#{new_user_session_path}']")
  end
end

Then(/^I see the user navigation menu$/) do
  within('.navbar') do
    expect(page).to have_css("a[href='#{pages_path}']")
    expect(page).to have_css("a[href='#{resources_path}']")
    expect(page).to have_css("a[href='#{recent_index_path}']")
    expect(page).to have_css("a[href='#{new_page_path}']")
    expect(page).to have_css("a[href='#{edit_user_registration_path}']")
    expect(page).to have_css("a[href='#{destroy_user_session_path}']")
  end
end

Then(/^I see the admin navigation menu$/) do
  within('.navbar') do
    expect(page).to have_css("a[href='#{pages_path}']")
    expect(page).to have_css("a[href='#{resources_path}']")
    expect(page).to have_css("a[href='#{recent_index_path}']")
    expect(page).to have_css("a[href='#{new_page_path}']")
    expect(page).to have_css("a[href='#{user_path}']")
    expect(page).to have_css("a[href='#{edit_user_registration_path}']")
    expect(page).to have_css("a[href='#{destroy_user_session_path}']")
  end
end