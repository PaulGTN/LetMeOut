require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do 
    @attendance = FactoryBot.create(:attendance)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:attendance)).to be_valid
  end

  
  context "associations" do

    describe "attendee" do
      it { expect(@attendance).to belong_to(:attendee) }
    end

    describe "event" do
      it { expect(@attendance).to belong_to(:event) }
    end

  end
  
end