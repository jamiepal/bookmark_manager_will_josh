class Tag
  def self.create(content)
    result = DatabaseConnection.query(
      "INSERT INTO tags (content)
      VALUES ('#{content}')
      RETURNING id, content;"
    )

    Tag.new(
      id: result[0]['id'],
      content: result[0]['content'],
        )
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};")
    result.map do |comment|
      Comment.new(
      id: comment['id'],
      text: comment['text'],
      bookmark_id: comment['bookmark_id']
    )
    end
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
