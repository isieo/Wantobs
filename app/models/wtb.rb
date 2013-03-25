class Wtb < ActiveRecord::Base
  serialize :properties, ActiveRecord::Coders::Hstore
  attr_accessible :additional_info, :budget, :item, :links, :quantity, :slug
  belongs_to :user
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

end