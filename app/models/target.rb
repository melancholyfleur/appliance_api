class Target < ActiveRecord::Base
  belongs_to :appliance

  validates :appliance_id, presence:   true

  validates :hostname,     presence:   true,
                           uniqueness: true

  validates :address,      presence:   true,
                           format:     {with: Resolv::IPv4::Regex}

  def reachable?
    Net::Ping::TCP.new(address,nil,0.1).ping?
  end
end
