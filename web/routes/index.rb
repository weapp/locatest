# frozen_string_literal: true

require "dry-schema"

App.get("/") do
  { status: "ok" }.to_json
end

App.get("/venue") do
  begin
    ::Base::Response.new(:ok,
                         locatest: Venue.first,
                         externals: [
                           from_platform(PlatformA::Client, service: :platform_a),
                           from_platform(PlatformB::Client, service: :platform_b),
                           from_platform(PlatformC::Client, service: :platform_c)
                         ]).to_json
  rescue => e
    halt(500, ::Base::Response.new(:error, e.class.name).to_json)
  end
end

App.post("/venue") do
  data = JSON.load(request.body)
  validation = schema_venue.call(data)
  next halt(400, ::Base::Response.new(:error, validation.errors).to_json) unless validation.errors.empty?

  ::Base::Response.new(:ok, Venue.first.update_all(validation.to_h)).to_json
end
