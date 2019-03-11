# frozen_string_literal: true

require "spec_helper"

describe "venues routes" do
  before do
    Venue.destroy_all
    example_venue.save
  end

  describe "get venue" do
    describe "with 3 remote errors" do
      before do
        expect(::PlatformA::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 404, body: ""))
        expect(::PlatformB::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 404, body: ""))
        expect(::PlatformC::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 404, body: ""))
      end

      it do
        expect(get("/venue")).to have_status_and_body(
          200,
          "status" => "ok",
          "data" =>
           { "locatest" =>
             { "name" => "Cummings-Lehner",
               "lat" => "59.1485919774",
               "lng" => "9.6239895111",
               "category_id" => 4,
               "closed" => false,
               "created_at" => String,
               "updated_at" => String,
               "website" => "https://localistico.com",
               "phone_number" => "+34666999666",
               "address_line_1" => "93432 Dario Station",
               "address_line_2" => "Apt. 809",
               "hours" =>
               [{ "starts_at" => "10:00", "ends_at" => "22:00" },
                { "starts_at" => "10:00", "ends_at" => "22:00" },
                { "starts_at" => "10:00", "ends_at" => "22:00" },
                { "starts_at" => "10:00", "ends_at" => "22:00" },
                { "starts_at" => "10:00", "ends_at" => "22:00" },
                { "starts_at" => "11:00", "ends_at" => "18:00" },
                { "starts_at" => "11:00", "ends_at" => "18:00" }] },
             "externals" =>
             [{ "service" => "platform_a", "status" => "error", "error" => 404 },
              { "service" => "platform_b", "status" => "error", "error" => 404 },
              { "service" => "platform_c", "status" => "error", "error" => 404 }] }
        )
      end
    end

    describe "with 3 remote success" do
      before do
        expect(::PlatformA::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 200, body: platform_a_success_response))
        expect(::PlatformB::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 200, body: platform_b_success_response))
        expect(::PlatformC::Client.instance).to receive(:request)
          .and_return(OpenStruct.new(status: 200, body: platform_c_success_response))
      end

      it do
        expect(get("/venue")).to have_status_and_body(
          200,
          "status" => "ok",
          "data" =>
          { "locatest" =>
            { "name" => "Cummings-Lehner",
              "lat" => "59.1485919774",
              "lng" => "9.6239895111",
              "category_id" => 4,
              "closed" => false,
              "created_at" => String,
              "updated_at" => String,
              "website" => "https://localistico.com",
              "phone_number" => "+34666999666",
              "address_line_1" => "93432 Dario Station",
              "address_line_2" => "Apt. 809",
              "hours" =>
              [{ "starts_at" => "10:00", "ends_at" => "22:00" },
               { "starts_at" => "10:00", "ends_at" => "22:00" },
               { "starts_at" => "10:00", "ends_at" => "22:00" },
               { "starts_at" => "10:00", "ends_at" => "22:00" },
               { "starts_at" => "10:00", "ends_at" => "22:00" },
               { "starts_at" => "11:00", "ends_at" => "18:00" },
               { "starts_at" => "11:00", "ends_at" => "18:00" }] },
            "externals" =>
            [{ "service" => "platform_a",
               "status" => "ok",
               "data" =>
               { "name" => "Cummings-Lehner",
                 "address_line_1" => "93432 Dario Station",
                 "address_line_2" => "<not available>",
                 "lat" => "59.1485919774",
                 "lng" => "9.6239895111",
                 "category_id" => 4,
                 "closed" => true,
                 "hours" =>
                 [{ "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" }],
                 "website" => "<not available>",
                 "phone_number" => "<not available>" } },
             { "service" => "platform_b",
               "status" => "ok",
               "data" =>
               { "name" => "Cummings-Lehner",
                 "address_line_1" => "93432 Dario Station",
                 "address_line_2" => "<not available>",
                 "lat" => "59.1485919774",
                 "lng" => "9.6239895111",
                 "category_id" => 4,
                 "closed" => false,
                 "hours" =>
                 [{ "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" }],
                 "website" => "<not available>",
                 "phone_number" => "<not available>" } },
             { "service" => "platform_c",
               "status" => "ok",
               "data" =>
               { "name" => "Cummings-Lehner",
                 "address_line_1" => "93432 Dario Station",
                 "address_line_2" => "Apt. 809",
                 "lat" => "59.1485919774",
                 "lng" => "9.6239895111",
                 "category_id" => -1,
                 "closed" => false,
                 "hours" =>
                 [{ "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "10:00", "ends_at" => "22:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" },
                  { "starts_at" => "11:00", "ends_at" => "18:00" }],
                 "website" => "https://localistico.com",
                 "phone_number" => "+34666999666" } }] }
        )
      end
    end
  end

  describe "update venue" do
    describe "success update" do
      before do
        expect(::PlatformA::UpdateWorker).to receive(:perform_async)
        expect(::PlatformB::UpdateWorker).to receive(:perform_async)
        expect(::PlatformC::UpdateWorker).to receive(:perform_async)
      end

      let(:body) do
        ' {
           "name" : "name",
           "address_line_1" : "addr1",
           "address_line_2" : "addr2",
           "category_id" : 1,
           "closed" : true,
           "lat" : "1.1111111111",
           "lng" : "1.1111111111",
           "s": "2222222222",
           "phone_number" : "+34600000000",
           "website" : "https://google.com",
           "hours" : [
             { "starts_at" : "01:00", "ends_at" : "22:00" },
             { "starts_at" : "02:00", "ends_at" : "22:00" },
             { "starts_at" : "03:00", "ends_at" : "22:00" },
             { "starts_at" : "04:00", "ends_at" : "22:00" },
             { "starts_at" : "05:00", "ends_at" : "22:00" },
             { "starts_at" : "06:00", "ends_at" : "18:00" },
             { "starts_at" : "07:00", "ends_at" : "18:00" }
           ]
         }'
      end

      it do
        expect(post("/venue", body)).to have_status_and_body(
          200, "status" => "ok",
               "data" =>
           { "name" => "name",
             "address_line_1" => "addr1",
             "address_line_2" => "addr2",
             "category_id" => 1,
             "closed" => true,
             "lat" => "1.1111111111",
             "lng" => "1.1111111111",
             "phone_number" => "+34600000000",
             "website" => "https://google.com",
             "created_at" => String,
             "updated_at" => String,
             "hours" =>
             [{ "starts_at" => "01:00", "ends_at" => "22:00" },
              { "starts_at" => "02:00", "ends_at" => "22:00" },
              { "starts_at" => "03:00", "ends_at" => "22:00" },
              { "starts_at" => "04:00", "ends_at" => "22:00" },
              { "starts_at" => "05:00", "ends_at" => "22:00" },
              { "starts_at" => "06:00", "ends_at" => "18:00" },
              { "starts_at" => "07:00", "ends_at" => "18:00" }] }
        )
      end
    end

    describe "wrong update payload" do
      let(:body) do
        ' {
           "category_id" : 3103,
           "closed" : "s",
           "lat" : "-1111111",
           "lng" : false,
           "hours" : [
             { "ends_at" : "22:00" },
             { "starts_at" : "02:00", "ends_at" : "22:00" },
             { "starts_at" : "03:00", "ends_at" : "22:00" },
             { "starts_at" : "04:00", "ends_at" : "22:00" },
             { "starts_at" : "05:00", "ends_at" : "22:00" },
             { "starts_at" : "06:00", "ends_at" : "18:00" },
             { "starts_at" : "07:00", "ends_at" : "aa:bb" }
           ]
         }'
      end

      it do
        expect(post("/venue", body)).to have_status_and_body(
          400,
          "status" => "error",
          "error" =>
            { "name" => ["is missing"],
              "lat" => ["must be greater than -90"],
              "lng" => ["must be a decimal"],
              "category_id" => ["must be less than 200"],
              "closed" => ["must be boolean"],
              "website" => ["is missing"],
              "phone_number" => ["is missing"],
              "address_line_1" => ["is missing"],
              "address_line_2" => ["is missing"],
              "hours" => { "0" => { "starts_at" => ["is missing"] },
                           "6" => { "ends_at" => ["is in invalid format"] } } }
        )
      end
    end
  end
end
