# See https://github.com/cursame/analytics/wiki/.
class AnalyticsClient
  include HTTParty
  base_uri ENV['ANALYTICS_API_URL']

  def initialize
    @options = { query: { timestamp: timestamp, consumer: consumer, signature: signature } }
  end

  def login(user)
    @options[:date] = Time.current.iso8601
    @options[:user] = user.id
    @options[:type] = 1
    self.class.post('/logins', @options)
  end

  private

  def timestamp
    Time.current.to_i
  end

  def consumer
    ENV['ANALYTICS_CONSUMER']
  end

  def signature
    ENV['ANALYTICS_SIGNATURE']
  end
end
