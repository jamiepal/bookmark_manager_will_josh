require 'bookmarktagjointable'
require 'tag'
require 'bookmark'
require 'database_helpers'

describe BookMarkTagJoinTable do
  describe '#link' do
    it 'creates a new entry in the bookmark_tag table linking a tag id to a bookmark id' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag = Tag.create(content: 'This is a test tag')
      bookmarktagjointable = BookMarkTagJoinTable.link(bookmark.id, tag.id)

      expect(bookmarktagjointable).to be_a BookMarkTagJoinTable
      expect(bookmarktagjointable.bookmark_id).to eq DatabaseConnection.query("SELECT * FROM bookmarks WHERE title = 'Makers Academy';")[0]["id"]
      expect(bookmarktagjointable.tag_id).to eq DatabaseConnection.query("SELECT * FROM tags WHERE content = 'This is a test tag';")[0]["id"]
    end
  end
end
