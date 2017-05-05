def add_link(tags: "news")
  visit '/links/new'
  fill_in 'title', with: 'BBC'
  fill_in 'url', with: 'http://www.bbc.co.uk'
  fill_in 'tag', with: tags
  click_button 'Add bookmark'
end
