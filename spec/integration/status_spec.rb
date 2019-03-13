# frozen_string_literal: true

require "spec_helper"

describe "status" do
  it { expect(get("/")).to have_status_and_body 200, "status" => "ok" }
end
