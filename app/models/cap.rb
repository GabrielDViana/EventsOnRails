class Cap < ActiveRecord::Base
    attr_accessible :user, :address, :title,:area, :date, :tag_list, :city,
        :state, :country, :latitude, :longitude, :cap_image
    belongs_to :user
    geocoded_by :address
    acts_as_taggable
    has_many :participations
    has_many :users, through: :participations

    after_validation    :geocode,
                        :if => :address_changed?

    validates   :title,
                presence: true

    validates_date  :date,
                    :after => :today

    has_attached_file   :cap_image
    validates_attachment    :cap_image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

        validates   :area,
                    presence: true,
                    :on => :create,
                    length:{ maximum: 1000 }
end
