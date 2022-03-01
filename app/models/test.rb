# frozen_string_literal: true

class Test < ApplicationRecord
  def self.by_category_title(category_title)
    sql = 'INNER JOIN categories ON tests.category_id = categories.id'
    joins(sql)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
