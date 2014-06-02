class Appliance < ActiveRecord::Base
  has_many :targets, dependent: :destroy

  validates :name,     uniqueness: true,
                       presence:   true

  validates :customer, presence:   true

  def target_count
    targets.count
  end

end
