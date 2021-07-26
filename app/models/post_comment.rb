class PostComment < ApplicationRecord

  belongs_to :post
  belongs_to :post_sale, class_name: 'Sale' , foreign_key: "post_sale_id", optional: true
  belongs_to :post_user, class_name: 'Customer' , foreign_key: "post_user_id", optional: true

  validates :comment, presence: true
end
