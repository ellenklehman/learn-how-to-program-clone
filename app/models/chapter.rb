class Chapter < ActiveRecord::Base
  validates :name, :presence => true
  has_many :sections
  has_many :lessons, :through => :sections
end
