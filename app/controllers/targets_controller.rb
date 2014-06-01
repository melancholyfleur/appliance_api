class TargetsController < ApplicationController

  #GET /targets/reachable
  def reachable
    targets = Hash[ *Target.find_each(batch_size:100).map { |target| [target.address, target.reachable?] }.flatten ]
    render :json => targets
  end

  def index
  end

end
