class FixEntityEscapeInTitle < ActiveRecord::Migration[7.0]

  WRONG_TITLE = 'Wie&#380;a Babel II (Tower of Babel II)'
  RIGHT_TITLE = CGI.unescapeHTML(WRONG_TITLE)

  def up
    update_title(WRONG_TITLE, RIGHT_TITLE)
  end

  def down
    update_title(RIGHT_TITLE, WRONG_TITLE)
  end

  private

  def update_title(from_title, to_title)
    stmt = ActiveRecord::Base.sanitize_sql(
      [
        'UPDATE items SET title = :to_title WHERE title = :from_title',
        { from_title: from_title, to_title: to_title }
      ]
    )
    exec_update(stmt)
  end

end
