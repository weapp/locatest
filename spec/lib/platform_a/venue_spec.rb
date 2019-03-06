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

    it { expect(subject.id).to eq 5 }
    it { expect(subject.name).to eq "Cummings-Lehner"}
    it { expect(subject.address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 1004 }
    it { expect(subject.closed).to eq true }
    xit { expect(subject.hours).not_to eq "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00" }
    it { expect(subject.created_at).to eq "2019-03-04T17:09:00.605Z" }
    it { expect(subject.updated_at).to eq "2019-03-04T17:09:00.605Z" }
  end

  describe "from standard" do
    subject { described_class.from_standard(example_venue.as_json) }

    xit { expect(subject.id).to eq 5 }
    it { expect(subject.name).to eq "Cummings-Lehner"}
    it { expect(subject.address).to eq "93432 Dario Station" }
    it { expect(subject.lat).to eq "59.1485919774" }
    it { expect(subject.lng).to eq "9.6239895111" }
    it { expect(subject.category_id).to eq 1004 }
    it { expect(subject.closed).to eq false }
    xit { expect(subject.hours).not_to eq "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00" }
  end
end
