class Plan < ApplicationRecord

  belongs_to :sale, class_name: 'Sale' , foreign_key: "from_id", optional: true
  belongs_to :customer, class_name: 'Customer' , foreign_key: "to_id", optional: true

  has_many :notifications, dependent: :destroy

  # 投稿者の識別
  def owner
    return sale.profile if sale.present?

    customer
  end

end
