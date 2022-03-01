# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(test_level)
    sql = 'INNER JOIN tests ON tests.author_id = users.id'
    joins(sql)
    .where(tests: { level: test_level })
  end
end
