class Repo < ActiveRecord::Base
  belongs_to :user
  has_many :commits
  has_many :notes
  has_many :resource_items
  has_many :todo_items
  validates_uniqueness_of :name, scope: :user_id
end
