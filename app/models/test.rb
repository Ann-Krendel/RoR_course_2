# frozen_string_literal: true
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.by_category_title(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
