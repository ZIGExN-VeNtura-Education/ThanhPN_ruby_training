class Micropost < ApplicationRecord
  # 1 User - Multiple microposts relation
  belongs_to :user

  # add attachment
  has_one_attached :image
  # Default get by created_by newest
  default_scope -> { order(created_at: :desc) }

  # Validates user_id, not null
  validates :user_id, presence: true

  # Validates content, not null, max 140 char
  validates :content, presence: true, length: { maximum: 140 }

  # validate image
  validates :image,
            content_type: { in: %w[image/jpg image/jpeg image/png],
                            message: "must be a valid image format" },
            size: { less_than: 5.megabytes, message: 'Less than 5 mb' }

  def display_image
    image.variant(resize_to_limit: [500,500])
  end
end

