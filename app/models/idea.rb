class Idea < ApplicationRecord
    has_many :comments
    mount_uploader :picture, PictureUploader

    validates :name, :description, :picture, presence: true
end
