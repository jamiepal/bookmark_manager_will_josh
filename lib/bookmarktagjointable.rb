class BookMarkTagJoinTable
  def self.link(bookmark_id, tag_id)
    result = DatabaseConnection.query("INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES('#{bookmark_id}', '#{tag_id}') RETURNING bookmark_id, tag_id ;")
    BookMarkTagJoinTable.new(id: result[0]['id'], bookmark_id: result[0]['bookmark_id'], tag_id: result[0]['tag_id'])
  end
  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id:, bookmark_id:, tag_id:)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end
end
