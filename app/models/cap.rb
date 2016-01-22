class Cap < ActiveRecord::Base
    attr_accessible :user, :adress,:title,:area, :date, :tag_list, :city,
        :state, :country
    belongs_to :user
    geocoded_by :address
    acts_as_taggable

    after_validation    :geocode,
                        :if => :address_changed?

    validates   :title,
                presence: true

    validates_date  :date,
                    :after => :today

end
