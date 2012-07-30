require 'spec_helper'

describe Transaction  do
  it 'should be invalid if no client exits' do
    transaction = Transaction.new
    transaction.should_not be_valid
    transaction.errors.should include(:client_id)
  end
  
  context 'has a status' do
    it 'default to failed' do
      transaction = Transaction.new
      transaction.save
      transaction.status.should == 'Failed'
    end
    it 'can be failed' do
      transaction = Transaction.new(client_id: 1, status: 'Failed')
      transaction.should be_valid
    end
    it 'can be successful' do
      transaction = Transaction.new(client_id: 1, status: 'Success')
      transaction.should be_valid
    end
    it 'can be pending' do
      transaction = Transaction.new(client_id: 1, status: 'Pending')
      transaction.should be_valid
    end
    it 'cannot be anything else' do
      transaction = Transaction.new(client_id: 1, status: 'Anything Else')
      transaction.should_not be_valid
    end
  end
end