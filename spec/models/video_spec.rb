require 'rails_helper'
require 'spec_helper'
require 'carrierwave/test/matchers'

RSpec.describe Video, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :file }
  end
end
