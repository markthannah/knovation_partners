class Spotlight < ActiveRecord::Base
  has_many :spotlightizations
  has_many :resources, :through => :spotlightizations

  has_attached_file :image, :styles => { :small => "200x200", :medium => "400x400>", :thumb => "100x100>", :large => "600x600" }
  do_not_validate_attachment_file_type :image

end
