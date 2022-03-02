# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_user
  has_many :tests, through: :tests_user

  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
