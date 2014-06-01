APPLIANCES = 10
MAX_TARGETS_PER_APPLIANCE = 5

def randomize(string)
  "#{rand 100000}-#{string}"
end

def create_appliance
  appliance = Appliance.create! name:     randomize(Faker::Internet.domain_name),
                                customer: Faker::Company.name

  rand(MAX_TARGETS_PER_APPLIANCE + 1).times {create_target(appliance)}
end

def create_target(appliance)
  Target.create! appliance: appliance,
                 hostname:  randomize(Faker::Internet.domain_name),
                 address:   Faker::Internet.ip_v4_address
end

APPLIANCES.times {create_appliance}
Target.create! appliance: Appliance.last,
               hostname: 'localhost',
               address: '127.0.0.1'
