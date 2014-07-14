class Commit < ActiveRecord::Base
  belongs_to :repo
  validates_uniqueness_of :sha
end
