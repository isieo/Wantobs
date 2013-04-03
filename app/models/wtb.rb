class Wtb < ActiveRecord::Base
  serialize :properties, ActiveRecord::Coders::Hstore
  attr_accessible :additional_info, :budget, :item, :links, :quantity, :slug, :wtb_images, :wtb_images_attributes
  belongs_to :user
  has_many :wtb_images
  accepts_nested_attributes_for :wtb_images
  before_save :save_slug
  make_permalink :item, :include_id => false

  %w[brand_new factory_warranty contact_method payment_method collection_method].each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("properties @> hstore(?, ?)", key, value) }

    define_method(key) do
      properties && properties[key]
    end

    define_method("#{key}=") do |value|
      self.properties = (properties || {}).merge(key => value)
    end
  end

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
