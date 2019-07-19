feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a tag is added to a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      visit'/'
      click_button 'Add Tag'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tag/new"

      fill_in 'tag', with: 'This is a tag'
      click_button 'Submit'

      expect(current_path).to eq "/"
      expect(page).to have_content 'This is a tag'
    end
  end
end
