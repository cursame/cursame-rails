require 'rails_helper'

RSpec.feature 'Send diferent header in massive mail' do
  background do
    create(:network)
    @user = create(:user)
    @admin = create(:user, role: 'admin')
  end

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @email = Notifier.send_email(@admin.id, @user.id, 'subject', 'message').deliver
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
    sender_name = Mail::Encodings.unquote_and_convert_to(@email[:from].display_names.first, 'utf-8')
    expect(sender_name).to include("#{@admin.first_name} #{@admin.last_name}")
  end

  it 'Receive the sender email' do
    expect(@email.from).to eq(["#{@admin.email}"])
  end
end
