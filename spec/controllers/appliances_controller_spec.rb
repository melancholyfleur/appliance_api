require 'spec_helper'

describe AppliancesController, :type => :controller do

  describe "#all_appliances" do
    it "returns a hash of appliances including readable name and target count" do
      appliance = Appliance.create name: 'app1', customer: 'WhiteHat'
      Target.create appliance_id: appliance.id, hostname: 'localhost', address: '127.0.0.1'
      Target.create appliance_id: appliance.id, hostname: 'testhost', address: '128.0.0.1'
      appliance2 = Appliance.create name: 'app2', customer: 'BlackHat'
      Target.create appliance_id: appliance2.id, hostname: 'darkhost', address: '64.233.160.1'
      Target.create appliance_id: appliance2.id, hostname: 'lighthost', address: '64.233.160.3'

      @json_response = {
        'App1' => 2,
        'App2' => 2
      }.to_json
      get "all_appliances"
      expect(response).to be_successful
      expect(response.body).to eq(@json_response)
    end
  end
end
