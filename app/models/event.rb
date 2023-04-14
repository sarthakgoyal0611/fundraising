class Event < ApplicationRecord
    belongs_to :user
    mount_uploader :photograph, PhotographUploader
    
    STATUSES = [:draft, :Completed, :Incompleted, :active]

    validates :title, presence: true, length: { minimum: 4, maximum: 100 }
    validates :description, presence: true, length: { minimum: 6, maximum: 1000 }
    validates :date, presence: true


    # validates :date, :expiry_date, presence: true, availability: true
    validate :expiry_date_after_date

    private

    def expiry_date_after_date
      return if expiry_date.blank? || date.blank?
  
      if expiry_date < date
        errors.add(:expiry_date, "must be after the start date")
    
      elsif expiry_date > date + 90.days
        errors.add(:expiry_date, " should not more than 90 days in future " )
    
      end

   end



  
end
