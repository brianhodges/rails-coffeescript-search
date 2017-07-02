class Author < ApplicationRecord
    VALID_NAME_REGEX = /\A[a-zA-Z.]+\Z/
    has_many :books, :dependent => :destroy
    accepts_nested_attributes_for :books, :allow_destroy => true
    validates_presence_of :first_name, :last_name
    validates :first_name, uniqueness: { scope: :last_name }
    validates :first_name, format: { with: VALID_NAME_REGEX }, :allow_blank => true
    validates :last_name, format: { with: VALID_NAME_REGEX }, :allow_blank => true
end
