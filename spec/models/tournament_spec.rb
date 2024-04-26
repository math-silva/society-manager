require 'rails_helper'

RSpec.describe Tournament, type: :model do
  context "validations" do
    let(:tournament) { create(:tournament) }

    it "is valid with valid attributes" do
      expect(tournament).to be_valid
    end

    it "is invalid with negative teams count" do
      tournament.teams_count = -1
      expect(tournament).not_to be_valid
    end
  end
end
