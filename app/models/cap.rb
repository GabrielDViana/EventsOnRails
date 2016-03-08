class Cap < ActiveRecord::Base
    attr_accessible :user, :address, :title,:area, :date, :tag_list, :city,
        :state, :country, :latitude, :longitude, :cap_image, :start_at, :end_at,
        :time_start, :time_end, :meetings, :observations

    belongs_to :user
    geocoded_by :address
    acts_as_taggable
    has_many :participations
    has_many :users, through: :participations

    after_validation    :geocode,
                        :if => :address_changed?

    validates   :title,
                presence: true

    validates_date  :start_at,
                    :after => :today

    validate :end_after_start

    validate :end_after_start_time

    validates :start_at, :end_at, :time_start, :time_end, :presence => true

    validates_numericality_of   :meetings,
                presence: true,
                greater_than: 0

    validates   :observations,
                length:{
                    maximum: 500
                }

    has_attached_file   :cap_image
    validates_attachment    :cap_image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    validates   :area,
                presence: true,
                :on => :create,
                length:{ maximum: 1000 }

  private
    def end_after_start
      return if end_at.blank? || start_at.blank?

      if end_at < start_at
        errors.add(:end_at, "Data final d eve ser após data inicial")
      end
    end

  private
    def end_after_start_time
      return if time_end.blank? || time_start.blank?

      if time_end < time_start
        errors.add(:end_at, "Horário final deve ser após data inicial")
      end
    end
end
