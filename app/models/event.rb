class Event < ApplicationRecord
    mount_uploader :photograph, PhotographUploader

    validates :title, presence: true, length: { minimum: 4, maximum: 100 }
    validates :description, presence: true, length: { minimum: 6, maximum: 1000 }
    validates :days_to_event, presence: true, length: { minimum: 1, maximum: 90 }
  
end
