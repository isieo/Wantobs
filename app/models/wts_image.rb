class WtsImage < ActiveRecord::Base
  attr_accessible :image, :name
  belongs_to :wts
  mount_uploader :image, WtsImageUploader
  before_create :default_name
  validates :image, :presence => true
  
  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if !image.blank?
  end
end
