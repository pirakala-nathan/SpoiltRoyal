class Picture < ActiveRecord::Base
  belongs_to :asset
  # add , :default_url => "/images/:style/missing.png" for default image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image
end
