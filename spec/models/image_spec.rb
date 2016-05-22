require 'rails_helper'

RSpec.describe Image, type: :model do
  it { is_expected.to validate_presence_of(:image_file) }
end
