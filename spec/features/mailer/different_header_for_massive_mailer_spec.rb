require 'rails_helper'

RSpec.feature 'Send diferent header in massive mail' do
  background do
    create(:network)
    @user = create(:user)
  end

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @email = Notifier.send_email('cosme', 'fulanito', 'admin@email.me', @user.id, 'subject', 'message').deliver
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'Should send an email' do
    expect(ActionMailer::Base.deliveries.count).to equal(1)
  end

  it 'Renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to eq([@user.email])
  end

  it 'Display the sender name' do
    expect(@email[:from].display_names).to eq(['cosme fulanito'])
  end

  it 'Receive the sender email' do
    expect(@email.from).to eq(['admin@email.me'])
  end
end
