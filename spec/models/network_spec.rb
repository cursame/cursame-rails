require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe Network, type: :model do

  before :each do
    @net = create(:network)
  end

  describe 'Model Factory' do
    it "has a multilanguage default attribute set to false" do
      expect(@net.multilanguage).to eq(false)
    end
  end

  describe 'Model Methods' do
    it 'Puts a job in Sidekiq queue when call send_email method' do
      user = create(:user)
      subject = 'RSpec'
      message = 'The queue must change in one job'
      assert_equal 0, Sidekiq::Extensions::DelayedMailer.jobs.size
      Notifier.delay.send_email(user.id,subject,message)
      assert_equal 1, Sidekiq::Extensions::DelayedMailer.jobs.size
    end
  end
end
