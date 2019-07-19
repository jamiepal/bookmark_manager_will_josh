require 'tag'
require 'bookmark'
require 'database_helpers'

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
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Tag.create(content: 'This is a test tag')
      Tag.create(content: 'This is a test tag two')

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first
      persisted_data = persisted_data(table: 'tags', id: content.id)

      expect(tags.length).to eq 2
      expect(tags.id).to eq persisted_data.first['id']
      expect(tags.content).to eq 'This is a test comment'
      expect(tags.bookmark_id).to eq bookmark.id
    end
  end
end
