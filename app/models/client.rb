class Client < ActiveRecord::Base
  attr_accessible :city, :name, :state, :zip, :balance
  
  has_many :transactions
  
  validates :name, presence: true
  validates :city, with: :should_be_from_chicago
  
  def should_be_from_chicago
    errors.add(:city, "must be from Chicago") if city != 'Chicago'
  end
  
  def completed_transactions
    self.transactions.where("status == 'Success'")
  end
  
end
