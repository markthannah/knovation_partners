class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :spotlightizations
  has_many :spotlights, :through => :spotlightizations

  scope :resource_type, -> (resource_type) {where resource_type: resource_type}

  has_attached_file :image, :styles => { :small => "200x200", :medium => "400x400>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image

  scope :subject, -> (subject) {where subject: subject}

  scope :elementary_math, -> {where(grade: 'Elementary').where(subject: 'Math')}
  scope :middle_math, -> {where(grade: 'Middle').where(subject: 'Math')}
  scope :high_math, -> {where(grade: 'High').where(subject: 'Math')}

  scope :elementary_science, -> {where(grade: 'Elementary').where(subject: 'Science')}
  scope :middle_science, -> {where(grade: 'Middle').where(subject: 'Science')}
  scope :high_science, -> {where(grade: 'High').where(subject: 'Science')}

  scope :elementary_ela, -> {where(grade: 'Elementary').where(subject: 'Language Arts')}
  scope :middle_ela, -> {where(grade: 'Middle').where(subject: 'Language Arts')}
  scope :high_ela, -> {where(grade: 'High').where(subject: 'Language Arts')}

  scope :elementary_ss, -> {where(grade: 'Elementary').where(subject: 'Social Studies')}
  scope :middle_ss, -> {where(grade: 'Middle').where(subject: 'Social Studies')}
  scope :high_ss, -> {where(grade: 'High').where(subject: 'Social Studies')}

  scope :elementary_finearts, -> {where(grade: 'Elementary').where(subject: 'Fine Arts')}
  scope :middle_finearts, -> {where(grade: 'Middle').where(subject: 'Fine Arts')}
  scope :high_finearts, -> {where(grade: 'High').where(subject: 'Fine Arts')}

  before_save do
    self.role.gsub!(/[\[\]\"]/, "") if attribute_present?("role")
  end

  before_save do
    self.language.gsub!(/[\[\]\"]/, "") if attribute_present?("language")
  end

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
  validates :lexile, presence: true

end
