Then(/^I can see a hyperlink to a "(.*?)" page$/) do |arg1|
  within( '.content-content') do
    find('a', text: arg1)
  end
end

Then(/^I can see a rendition of an image$/) do
  within( '.content-content') do
    find('img')
  end
end

Then(/^I can see the Youtube video "(.*?)"$/) do |video_id|
  page.should have_css("iframe[src='//www.youtube.com/embed/#{video_id}']")
end

Then(/^I can see a Vimeo video$/) do
  pending # express the regexp above with the code you wish you had
end

