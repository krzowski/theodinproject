class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings

  scope :upcoming, lambda { where("date > ?", DateTime.now).order(:date) }
  scope :past, lambda { where("date < ?", DateTime.now).order(:date) }

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
