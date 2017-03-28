require "spec_helper"

describe ReaRobot::Table do
  let(:table) {ReaRobot::Table.new(5, 5)}

  context "valid_position?" do
    it "is valid postion" do
      expect(table.valid_position?(0, 0)).to be true
      expect(table.valid_position?(3, 4)).to be true
    end

    it "is unvalid postion" do
      expect(table.valid_position?(5, 5)).to be false
      expect(table.valid_position?(-1, -1)).to be false
    end
  end
end

