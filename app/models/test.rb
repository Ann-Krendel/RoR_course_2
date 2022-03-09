# frozen_string_literal: true
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :tests_users
  has_many :users, through: :tests_user
  has_many :questions

  def self.by_category_title(category_title)
    sql = 'INNER JOIN categories ON tests.category_id = categories.id'
    joins(sql)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
