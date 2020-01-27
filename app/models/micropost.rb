class Micropost < ApplicationRecord
  belongs_to :user
  # anonymous function below which workks as shown in console
  #   >> -> { puts "foo" }
  # => #<Proc:0x007fab938d0108@(irb):1 (lambda)>
  # >> -> { puts "foo" }.call
  # foo
  # => nil
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
