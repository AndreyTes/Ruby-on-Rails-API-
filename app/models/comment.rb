class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :description
end
