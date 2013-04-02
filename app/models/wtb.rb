class Wtb < ActiveRecord::Base
  serialize :properties, ActiveRecord::Coders::Hstore
  attr_accessible :additional_info, :budget, :item, :links, :quantity, :slug, :image, :remote_image_url
  belongs_to :user
  before_save :save_slug
  mount_uploader :image, WtbImageUploader
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
