class WtbImage < ActiveRecord::Base
  attr_accessible :image, :name
  belongs_to :wtb
  mount_uploader :image, WtbImageUploader
  before_create :default_name
  
  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
end
