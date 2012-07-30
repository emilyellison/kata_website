require 'spec_helper'

describe Client do 
  
  it 'should require name' do
    client = Client.new
    client.should_not be_valid
    client.errors.should include(:name)
  end
  
  it 'should be from Chicago' do
    client = Client.new(name: 'Joe', city: 'New York')
    client.should_not be_valid
  end
  
  it 'is valid if from Chicago' do
    client = Client.new(name: 'Joe', city: 'Chicago')
    client.should be_valid
  end

  it 'starts with an outstanding balance of 0' do
    client = Client.new(name: 'Joe', city: 'Chicago')
    client.save
    client.balance.should == 0
  end
  
  it 'should have many transactions' do
    client = Client.create(name: 'Joe', city: 'Chicago')
    a = Transaction.create(client_id: client.id)
    b = Transaction.create(client_id: client.id)
    c = Transaction.create(client_id: client.id)
    client.transactions.map(&:id).should == [a.id, b.id, c.id]
  end
  
  describe '#completed_transactions' do
    client = Client.create(name: 'Joe', city: 'Chicago')
    it 'collects all the completed transactions' do
      a = Transaction.create(client_id: client.id, status: 'Success')
      b = Transaction.create(client_id: client.id, status: 'Failed')
      c = Transaction.create(client_id: client.id, status: 'Success')
      d = Transaction.create(client_id: client.id, status: 'Pending')
      client.completed_transactions.collect { |x| x.id }.should include(a.id)
      client.completed_transactions.collect { |x| x.id }.should include(c.id)
    end
    it 'does not include a failed transaction' do
      a = Transaction.create(client_id: client.id, status: 'Success')
      b = Transaction.create(client_id: client.id, status: 'Failed')
      c = Transaction.create(client_id: client.id, status: 'Success')
      d = Transaction.create(client_id: client.id, status: 'Pending')
      client.completed_transactions.collect { |x| x.id }.should_not include(b.id)
    end
    it 'is blank if there are no transactions' do
      client.completed_transactions.should be_empty
    end
  end
end