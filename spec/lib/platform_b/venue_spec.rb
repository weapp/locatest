# frozen_string_literal: true

require "spec_helper"

describe PlatformB::Venue do
  describe "from network" do
    subject do
      described_class.from_json('{
        "id": 5,
        "name": "Cummings-Lehner",
        "street_address": "93432 Dario Station",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "category_id": 2004,
        "closed": false,
        "hours": "Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00",
        "created_at": "2019-03-04T17:09:00.640Z",
        "updated_at": "2019-03-04T17:09:00.640Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }')
    end

    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.street_address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 2004 }
    it { expect(subject.closed).to eq false }
    it { expect(subject.hours).to eq "Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00" }
    it { expect(subject.created_at).to eq "2019-03-04T17:09:00.640Z" }
    it { expect(subject.updated_at).to eq "2019-03-04T17:09:00.640Z" }

    it do
      expect(subject.to_standard).to eq(
        "name" => "Cummings-Lehner",
        "address_line_1" => "93432 Dario Station",
        "address_line_2" => "<not available>",
        "phone_number" => "<not available>",
        "website" => "<not available>",
        "lat" => "59.1485919774",
        "lng" => "9.6239895111",
        "category_id" => 4,
        "closed" => false,
        "hours" => [
          { "starts_at" => "10:00", "ends_at" => "22:00" },
          { "starts_at" => "10:00", "ends_at" => "22:00" },
          { "starts_at" => "10:00", "ends_at" => "22:00" },
          { "starts_at" => "10:00", "ends_at" => "22:00" },
          { "starts_at" => "10:00", "ends_at" => "22:00" },
          { "starts_at" => "11:00", "ends_at" => "18:00" },
          { "starts_at" => "11:00", "ends_at" => "18:00" }
        ]
      )
    end
  end

  describe "from standard" do
    subject { described_class.from_standard(example_venue.as_json) }

    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.street_address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 2004 }
    it { expect(subject.closed).to eq false }
    it { expect(subject.hours).to eq "Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00" }
  end
end
