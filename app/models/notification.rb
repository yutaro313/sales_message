class Notification < ApplicationRecord
  belongs_to :message, optional: true
  belongs_to :plan, optional: true

  belongs_to :seq

  def self.confirmed
    unchecked_notifications = where(checked: false)
    unchecked_notifications.each do |un|
      un.update!(checked: true)
    end
  end

end
