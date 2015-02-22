require 'rails_helper'

RSpec.describe VK::WallPost, type: :model do
  it 'have valid factory' do
    expect(build :vk_wall_post).to be_valid
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
