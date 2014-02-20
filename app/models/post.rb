class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, prescence: true
  validates :body, prescence: true
end
