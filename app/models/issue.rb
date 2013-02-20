class Issue < ActiveRecord::Base
  attr_accessible :description, :no_followers, :title
  belongs_to :project
  validates :title, presence: true, uniqueness: {message: "Title Must be unique sir!"}
  validates :description, presence: true, length: {maximum: 20, minimum: 6}
  validates :no_followers, numericality: true, allow_blank: true
  validates_with Yesnovalidator
  after_create :add_to_timeline

  private
  	def add_to_timeline
  		Timeline.create!({content: "An issue was created!",timelineable_id: self.id, timelineable_type: self.class.to_s})
  	end
end
