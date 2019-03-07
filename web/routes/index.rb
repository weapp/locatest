# frozen_string_literal: true

require "dry-schema"

App.get("/") do
  { status: "ok" }.to_json
end

App.helpers do
  def from_platform(client, **base)
    base.merge(client.new.venue.ok_then(&:to_standard).as_json)
  end

  def error
    nil
  end

  def parse_hours(data_hours)
    return error if data_hours.is_a?(Array)
    return error if data_hours.count != 7
  end

  def schema_venue
    Dry::Schema.Params do
      required(:name).filled(:string)
      required(:lat).filled(:string)
      required(:lng).filled(:string)
      required(:category_id) { int? & gt?(0) & lt?(200) }
      required(:closed)
      required(:website).filled(:string)
      required(:phone_number).filled(:string)
      required(:address_line_1).filled(:string)
      required(:address_line_2).filled(:string)
    end
  end
end

App.get("/venue") do
  {
    locatest: Venue.first,
    externals: [
      from_platform(PlatformA::Client, service: :platform_a),
      from_platform(PlatformB::Client, service: :platform_b),
      from_platform(PlatformC::Client, service: :platform_c)
    ]
  }.to_json
end

App.post("/venue") do
  data = JSON.load(request.body)
  validation = schema_venue.call(data)
  if validation.errors.empty?
    Venue.first.update_all(validation.to_h).to_json
  else
    validation.errors.to_json
  end
  # data["hours"] = parse_hours(data["hours"]) if data["hours"]
end
