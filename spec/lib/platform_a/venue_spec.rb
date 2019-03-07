# frozen_string_literal: true

require "spec_helper"

describe PlatformA::Venue do
  describe "from network" do
    subject do
      described_class.from_json('{
        "id": 5,
        "name": "Cummings-Lehner",
        "address": "93432 Dario Station",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "category_id": 1004,
        "closed": true,
        "hours": "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00",
        "created_at": "2019-03-04T17:09:00.605Z",
        "updated_at": "2019-03-04T17:09:00.605Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }')
    end

    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 1004 }
    it { expect(subject.closed).to eq true }
    it { expect(subject.hours).to eq "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00" }
    it { expect(subject.created_at).to eq "2019-03-04T17:09:00.605Z" }
    it { expect(subject.updated_at).to eq "2019-03-04T17:09:00.605Z" }

    it do
      expect(subject.to_standard).to eq(
        "name" => "Cummings-Lehner",
        "address_line_1" => "93432 Dario Station",
        "category_id" => 4,
        "closed" => true,
        "lat" => "59.1485919774",
        "lng" => "9.6239895111",
        "hours" => [
          {"starts_at"=>"10:00", "ends_at"=>"22:00"},
          {"starts_at"=>"10:00", "ends_at"=>"22:00"},
          {"starts_at"=>"10:00", "ends_at"=>"22:00"},
          {"starts_at"=>"10:00", "ends_at"=>"22:00"},
          {"starts_at"=>"10:00", "ends_at"=>"22:00"},
          {"starts_at"=>"11:00", "ends_at"=>"18:00"},
          {"starts_at"=>"11:00", "ends_at"=>"18:00"}],
      )
    end
  end

  describe "from standard" do
    subject { described_class.from_standard(example_venue.as_json) }

    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 1004 }
    it { expect(subject.closed).to eq false }
    it { expect(subject.hours).to eq "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00" }

    it do
      expect(subject.as_json).to eq(
        "address" => "93432 Dario Station",
        "category_id" => 1004,
        "closed" => false,
        "hours" => "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00",
        "lat" => "59.1485919774",
        "lng" => "9.6239895111",
        "name" => "Cummings-Lehner"
      )
    end
  end
end
