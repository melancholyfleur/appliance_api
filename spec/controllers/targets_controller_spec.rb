require 'spec_helper'

describe TargetsController, :type => :controller do

  describe "#reachable" do
    it "returns a hash of targets and whether or not they are reachable" do
      appliance = Appliance.create name: 'app1', customer: 'WhiteHat'
      Target.create appliance_id: appliance.id, hostname: 'localhost', address: '127.0.0.1'
      Target.create appliance_id: appliance.id, hostname: 'testhost', address: '128.0.0.1'
      @json_response = {
        '127.0.0.1' => true,
        '128.0.0.1' => false
      }.to_json
      get "reachable"
      expect(response).to be_successful
      expect(response.body).to eq(@json_response)
    end
  end

end
