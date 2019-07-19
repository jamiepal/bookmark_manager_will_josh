require 'tag'
require 'bookmark'
require 'database_helpers'

describe Comment do
  describe '.create' do
    it 'creates a new tag' do
      content = 'This is a test tag'
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag = Tag.create(content)

      persisted_data = persisted_data(table: 'tags', id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first['id']
      expect(tag.content).to eq 'This is a test tag'
    end
  end

  # describe '.where' do
  #   it 'gets the relevant comments from the databse' do
  #     bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
  #     Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)
  #     Comment.create(text: 'This is a second test comment', bookmark_id: bookmark.id)
  #
  #     comments = Comment.where(bookmark_id: bookmark.id)
  #     comment = comments.first
  #     persisted_data = persisted_data(table: 'comments', id: comment.id)
  #
  #     expect(comments.length).to eq 2
  #     expect(comment.id).to eq persisted_data.first['id']
  #     expect(comment.text).to eq 'This is a test comment'
  #     expect(comment.bookmark_id).to eq bookmark.id
  #   end
  # end
end
