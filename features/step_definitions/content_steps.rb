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

Then(/^I can see Youtube video "(.*?)"$/) do |video_id|
  within( '.content-content') do
    expect(page).to have_css("iframe[src='//youtube.com/embed/#{video_id}']")
  end
end

Then(/^I can see Vimeo video "(.*?)"$/) do |video_id|
  within( '.content-content') do
    expect(page).to have_css("iframe[src='//player.vimeo.com/video/#{video_id}']")
  end
end