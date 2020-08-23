class Article < ApplicationRecord
    has_one_attached :image
    #validates :image, presence: true, blob: { content_type: :image }
    validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
    validates :title, presence: true, length: { minimum: 5}
    belongs_to :user
    has_many :comments
end
