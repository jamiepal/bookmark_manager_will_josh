require 'tag'
require 'bookmark'
require 'database_helpers'
require 'bookmarktagjointable'


describe Comment do
  describe '.create' do
    it 'creates a new tag' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag = Tag.create(content: 'This is a test tag')

      persisted_data = persisted_data(table: 'tags', id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first['id']
      expect(tag.content).to eq 'This is a test tag'
    end
  end

  describe '.where' do
    it 'gets the relevant tags from the database' do
      bookmark1 = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag1 = Tag.create(content: 'This is a test tag')
      bookmarktagjoin1 = BookMarkTagJoinTable.link(bookmark1.id, tag1.id)
      bookmark2 = Bookmark.create(url: "http://www.google.com", title: "google")
      tag2 = Tag.create(content: 'This is a test tag two')
      bookmarktagjoin2 = BookMarkTagJoinTable.link(bookmark2.id, tag2.id)
      tag3 = Tag.create(content: 'This is a test tag three')
      bookmarktagjoin2 = BookMarkTagJoinTable.link(bookmark1.id, tag3.id)

      tags = Tag.where(bookmark_id: bookmark1.id)

      expect(tags.length).to eq 2
      expect(tags[0].content).to eq 'This is a test tag'
      expect(tags[1].content).to eq 'This is a test tag three'
    end
  end
end
