class Message < ApplicationRecord
  belongs_to :sale, class_name: 'Sale' , foreign_key: "to_id", optional: true
  belongs_to :sale, class_name: 'Sale' , foreign_key: "from_id", optional: true
  belongs_to :customer, class_name: 'Customer' , foreign_key: "to_id", optional: true
  belongs_to :customer, class_name: 'Customer' , foreign_key: "from_id", optional: true

  has_one_attached :image
  validates :title, :introduction, length: { maximum: 200 }


  def owner
    return sale.profile if sale.present?

    customer
  end

end
