# frozen_string_literal: true

class User < ApplicationRecord

  def tests_by_level(test_level)
    sql = 'JOIN tests_users ON tests.id = tests_users.test_id'
    joins(sql)
      .where(tests_users: {user_id: id})
      .where(level: test_level)
  end
end
