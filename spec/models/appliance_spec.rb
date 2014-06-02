require 'spec_helper'

describe Appliance, :type => :model do
  describe "#new" do
    it "validates unique appliance names" do
      Appliance.create name: 'app1', customer: 'WhiteHat'
      appliance = Appliance.new name: 'app1', customer: 'WhiteHat'
      expect(appliance.save).to be(false)
    end
  end

  describe "#target_count" do
    it "returns accurate number of targets for given appliance" do
      appliance = Appliance.create name: 'app1', customer: 'WhiteHat'
      Target.create appliance_id: appliance.id, hostname: 'localhost', address: '127.0.0.1'
      expect(appliance.target_count).to equal(1)
    end
  end
end
