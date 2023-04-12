class Event < ApplicationRecord
    mount_uploader :photograph, PhotographUploader
end
