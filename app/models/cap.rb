class Cap < ActiveRecord::Base
    belongs_to :user
    geocoded_by :address

    after_validation    :geocode,
                        :if => :address_changed?

    validates   :title,
                presence: true

    validates   :area,
                presence: true

    validates_date  :date,
                    :after => :today

end
