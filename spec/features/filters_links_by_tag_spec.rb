feature 'Filters links by tag' do
  before(:each) do
    Link.create(title: 'BBC', url: 'http://www.bbc.co.uk', tags: [Tag.first_or_create(:name => 'News')])
    Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com', tags: [Tag.first_or_create(:name => 'education')])
    Link.create(title: 'Bubblebobble', url: 'http://www.bubble-bobble.com', tags: [Tag.first_or_create(:name => 'bubbles')])
  end

    scenario "Filters by the tag 'bubbles'" do
      visit 'tags/bubbles'
      within 'ul#links' do
        expect(page).to not_have_content('BBC')
        expect(page).to not_have_content('Makers Academy')
        expect(page).to have_content('Bubblebobble')
      end
    end
end