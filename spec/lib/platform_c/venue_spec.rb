# frozen_string_literal: true

require "spec_helper"

describe PlatformC::Venue do
  describe "from network" do
    subject do
      described_class.from_json('{
        "id": 5,
        "name": "Cummings-Lehner",
        "address_line_1": "93432 Dario Station",
        "address_line_2": "Apt. 809",
        "website": "https://localistico.com",
        "phone_number": "+34666999666",
        "lat": "59.1485919774",
        "lng": "9.6239895111",
        "closed": false,
        "hours": "10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00",
        "created_at": "2019-03-04T17:09:00.657Z",
        "updated_at": "2019-03-04T17:09:00.657Z",
        "api_key": "0a244d74f524b60ac8582131703e99ac"
      }')
    end

    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.address_line_1).to eq "93432 Dario Station" }
    it { expect(subject.address_line_2).to eq "Apt. 809" }
    it { expect(subject.website).to eq "https://localistico.com" }
    it { expect(subject.phone_number).to eq "+34666999666" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.closed).to eq false }
    it { expect(subject.hours).to eq "10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00" }
    it { expect(subject.created_at).to eq "2019-03-04T17:09:00.657Z" }
    it { expect(subject.updated_at).to eq "2019-03-04T17:09:00.657Z" }
  end

  describe "from standard" do
    subject { described_class.from_standard(example_venue.as_json) }
    it { expect(subject.name).to eq "Cummings-Lehner" }
    it { expect(subject.address_line_1).to eq "93432 Dario Station" }
    it { expect(subject.address_line_2).to eq "Apt. 809" }
    it { expect(subject.website).to eq "https://localistico.com" }
    it { expect(subject.phone_number).to eq "+34666999666" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.closed).to eq false }
    it { expect(subject.hours).to eq "10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00" }
  end
end