class Cap < ActiveRecord::Base
    belongs_to :user

    validates   :title,
                presence: true

    validates   :area,
                presence: true

    validates_date  :date,
                    :after => :today

end
