require 'rails_helper'

RSpec.describe Tour, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:locations) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
