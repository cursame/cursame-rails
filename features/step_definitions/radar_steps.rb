Given(/^a network$/) do
  @radar_network = create(:radar_network).network
  @network = build(:network, subdomain: 'test')
end

Then(/^check if it has a radar token$/) do
  assert(@radar_network.radar_token?)
  assert(!@network.radar_token?)
end

Then(/^get radar token$/) do
  assert_equal(@radar_network.radar_token, "08232668a6fad9cd")
  assert_equal(@network.radar_token, "")
end
