class Resource < ActiveRecord::Base
  belongs_to :user

  scope :subject, -> (subject) {where subject: subject}

  validates :url, presence: true
  validates :title, presence: true
  validates :author_publisher, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :grade, presence: true
  validates :role, presence: true
  validates :readability, presence: true
  validates :language, presence: true
  validates :lrt, presence: true
  validates :keyword, presence: true
  validates :standard, presence: true

end
