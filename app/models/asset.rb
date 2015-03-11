class Asset < ActiveRecord::Base
  belongs_to :vendor
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>",:profile => "200x200>" }
  
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  before_create :update_file_name

  private

  # change file name to vendor_name_#
  def update_file_name
    new_name = self.vendor.business_name.downcase.tr(" ", "_") + "_"
    number = Asset.last.nil? ? "1" : (Asset.last.id + 1).to_s
    extension = File.extname(image_file_name).downcase

    self.image.instance_write(:file_name, new_name + number + extension)
  end
end
