# frozen_string_literal: true
class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_by_level(test_level)
    sql = 'JOIN tests_users ON tests.id = tests_users.test_id'
    joins(sql)
      .where(tests_users: {user_id: id})
      .where(level: test_level)
  end

  def user_test(test)
    test.tests_users.order(id: :desc).find_by(test: test)
  end
end
