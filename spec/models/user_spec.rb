require 'rails_helper'

Rspec.describe User, type: :model do
  before do
    @user = FactorBot.build(:user)
  end
