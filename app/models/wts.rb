class Wts < ActiveRecord::Base
  before_save :save_slug
  attr_accessible :contactmethod, :information, :item, :links, :paymentmethod, :pickup, :price, :quantity, :used, :warranty, :slug
  make_permalink :item, :include_id => false
  validates :item, :presence => true
  belongs_to :user
   
  def save_slug
    self.slug = self.permalink
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['item LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
