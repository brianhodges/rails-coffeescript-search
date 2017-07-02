class Book < ApplicationRecord
  belongs_to :author
  validates_presence_of :title
  validates :title, uniqueness: { scope: :author_id }
  default_scope { order("title ASC") }
end
