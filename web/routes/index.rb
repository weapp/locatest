# frozen_string_literal: true

App.get("/") do
  { status: "ok" }.to_json
end

App.helpers do
  def from_platform(client, **base)
    base.merge(client.new.venue.ok_then(&:to_standard).as_json)
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
