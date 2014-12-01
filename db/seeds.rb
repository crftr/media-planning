puts 'Removing old data...'

AdvertisingType.destroy_all
CampaignType.destroy_all
Client.destroy_all
Contract.destroy_all
Engagement.destroy_all
FinancialYear.destroy_all
MediaType.destroy_all
User.destroy_all
Vendor.destroy_all


puts 'Adding seed data...'

user = User.create(
  name:     'Demo User',
  username: 'demo',
  email:    'demo@example.com',
  password: 'demo')

[2013, 2014, 2015, 2016].each do |year|
  MPLAN::Creators::FinancialYearCreator.new(
    user: user,
    name: "FY#{year}",
    start_date: Date.new(year, 1, 1),
    end_date: Date.new(year, 12, 31)).save
end

['Nederlander', 'Live Nation', 'AEG'].each do |client_name|
  MPLAN::Creators::ClientCreator.new(user: user, client_name: client_name).save
end

clients = Client.all
['Mew', 'Local Natives', 'Stolen Babies', 'Louis CK', 'Françoise Gilot',
 'The Tony Danza Tapdance Extravaganza'].each do |engagement_name|
  client = clients.shuffle[0]
  MPLAN::Creators::EngagementCreator.new(client: client, engagement_name: engagement_name).save
end

['iHeartMedia', 'Hearst Corp', 'Hubbard Broadcasting', 'CBS Corp',
 'Ion Media Networks', 'News Corp', 'Vice', 'Organizações Globo'].each do |vendor_name|
  MPLAN::Creators::VendorCreator.new(user: user, vendor_name: vendor_name).save
end

CampaignType.create(name: 'Extension',      global: true, display_order: 1)
CampaignType.create(name: 'Closing',        global: true, display_order: 2)
CampaignType.create(name: 'Discount',       global: true, display_order: 3)
CampaignType.create(name: 'Branding',       global: true, display_order: 4)
CampaignType.create(name: 'Product Launch', global: true, display_order: 5)
CampaignType.create(name: 'Annual',         global: true, display_order: 6)

outdoor     = MediaType.create(name: 'Outdoor',     global: true, display_order: 1)
print       = MediaType.create(name: 'Print',       global: true, display_order: 2)
online      = MediaType.create(name: 'Online',      global: true, display_order: 3)
television  = MediaType.create(name: 'Television',  global: true, display_order: 4)
radio       = MediaType.create(name: 'Radio',       global: true, display_order: 5)
production  = MediaType.create(name: 'Production',  global: true, display_order: 6)
misc        = MediaType.create(name: 'Misc',        global: true, display_order: 7)
group_sales = MediaType.create(name: 'Group Sales', global: true, display_order: 8)
pr          = MediaType.create(name: 'PR',          global: true, display_order: 9)
signage     = MediaType.create(name: 'Signage',     global: true, display_order: 10)

AdvertisingType.create(name: 'Group Sales',          global: true, media_type: group_sales)
AdvertisingType.create(name: 'Brochures',            global: true, media_type: misc)
AdvertisingType.create(name: 'Membership',           global: true, media_type: misc)
AdvertisingType.create(name: 'Production Charges',   global: true, media_type: misc)
AdvertisingType.create(name: 'Ad Serving',           global: true, media_type: online)
AdvertisingType.create(name: 'Behavioral Targeting', global: true, media_type: online)
AdvertisingType.create(name: 'Cost Per Click',       global: true, media_type: online)
AdvertisingType.create(name: 'Cost Per Thousand',    global: true, media_type: online)
AdvertisingType.create(name: 'Bulletin',             global: true, media_type: outdoor)
AdvertisingType.create(name: 'Bus Shelter',          global: true, media_type: outdoor)
AdvertisingType.create(name: 'Digital Boards',       global: true, media_type: outdoor)
AdvertisingType.create(name: 'King Kongs',           global: true, media_type: outdoor)
AdvertisingType.create(name: 'Kongs',                global: true, media_type: outdoor)
AdvertisingType.create(name: 'Poster Panel',         global: true, media_type: outdoor)
AdvertisingType.create(name: 'Production Charges',   global: true, media_type: outdoor)
AdvertisingType.create(name: 'Special',              global: true, media_type: outdoor)
AdvertisingType.create(name: 'Taxi Top',             global: true, media_type: outdoor)
AdvertisingType.create(name: 'Transit King Card',    global: true, media_type: outdoor)
AdvertisingType.create(name: 'Transit Wrap',         global: true, media_type: outdoor)
AdvertisingType.create(name: 'PR',                   global: true, media_type: pr)
AdvertisingType.create(name: 'Weekly',               global: true, media_type: print)
AdvertisingType.create(name: 'Monthly',              global: true, media_type: print)
AdvertisingType.create(name: 'Daily Weekday',        global: true, media_type: print)
AdvertisingType.create(name: 'Daily Weekend',        global: true, media_type: print)
AdvertisingType.create(name: 'Quarter Page',         global: true, media_type: print)
AdvertisingType.create(name: 'Half Page',            global: true, media_type: print)
AdvertisingType.create(name: 'Full Page',            global: true, media_type: print)
AdvertisingType.create(name: 'Special Edition',      global: true, media_type: print)
AdvertisingType.create(name: 'Production Charges',   global: true, media_type: production)
AdvertisingType.create(name: 'Morning Drive',        global: true, media_type: radio)
AdvertisingType.create(name: 'Midday',               global: true, media_type: radio)
AdvertisingType.create(name: 'Afternoon Drive',      global: true, media_type: radio)
AdvertisingType.create(name: 'Evening',              global: true, media_type: radio)
AdvertisingType.create(name: 'Window Graphics',      global: true, media_type: signage)
AdvertisingType.create(name: 'Onsite Signage',       global: true, media_type: signage)
AdvertisingType.create(name: 'Venue Display',        global: true, media_type: signage)
AdvertisingType.create(name: 'Late Evening',         global: true, media_type: television)
AdvertisingType.create(name: 'Early Morning',        global: true, media_type: television)
AdvertisingType.create(name: 'Midday',               global: true, media_type: television)
AdvertisingType.create(name: 'Early Fringe',         global: true, media_type: television)
AdvertisingType.create(name: 'Prime Access',         global: true, media_type: television)
AdvertisingType.create(name: 'Prime Time',           global: true, media_type: television)
