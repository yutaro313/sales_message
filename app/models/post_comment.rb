class PostComment < ApplicationRecord

  belongs_to :post
  belongs_to :post_user_id, class_name: 'sale'
  belongs_to :post_user_id, class_name: 'customer'
end
