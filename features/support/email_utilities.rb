module EmailUtilities
  def check_comment_email_content(user_name, comment, commenter, page_title)
    open_last_email_for(user_email(user_name))

    expect(current_email.to_addrs).to eq [ user_email(user_name) ]
    expect(current_email).to have_subject(Regexp.new("New comment on page #{page_title}"))
    expect(current_email.default_part_body.to_s).to include(page_title)
    expect(current_email.default_part_body.to_s).to include(comment)
    expect(current_email.default_part_body.to_s).to include(commenter)
    expect(current_email.default_part_body.to_s).to include(page_path Page.find_by_title(page_title))
  end
end

World(EmailUtilities)