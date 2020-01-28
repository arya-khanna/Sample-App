class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  # anonymous function below which workks as shown in console
  #   >> -> { puts "foo" }
  # => #<Proc:0x007fab938d0108@(irb):1 (lambda)>
  # >> -> { puts "foo" }.call
  # foo
  # => nil
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
                                      
                                      
  # Returns a resized image for display
  def display_image
    image.variant(resize_to_limit: [500,500])
  end 
  
end
