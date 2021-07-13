class PostComment < ApplicationRecord

  belongs_to :post
  belongs_to :post_user, class_name: 'Sale' , foreign_key: "post_user_id"
  belongs_to :post_user, class_name: 'Customer' , foreign_key: "post_user_id"
end
