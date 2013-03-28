class Wts < ActiveRecord::Base
  before_save :save_slug
  attr_accessible :contactmethod, :information, :item, :links, :paymentmethod, :pickup, :price, :quantity, :used, :warranty, :slug
  make_permalink :item, :include_id => false
  validates :item, :presence => true
   
  def save_slug
    self.slug = self.permalink
  end
end
