class Transaction < ActiveRecord::Base
  attr_accessible :client_id, :cost, :item, :status
  
  validates :client_id, presence: true
  validates :status, with: :should_be_failed_success_or_pending
  
  def should_be_failed_success_or_pending
    if ['Failed', 'Success', 'Pending'].include?(status) == false
      errors.add(:status, "must be 'Failed', 'Success', or 'Pending'")
    end 
  end
end
