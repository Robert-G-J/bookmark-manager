feature 'Add tag to link' do
  scenario 'Adds a tag to the link and saves it' do
    add_link
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('news')
    end
  end
  scenario 'Adds multiple tags to a link' do
    add_link(tags: "news uk")

    within 'ul#links' do
      expect(page).to have_content('news uk')
      expect(Link.first.tags.map{ |tag| tag.name }).to include('news', 'uk')
    end

  end
end
