# frozen_string_literal: true

RSpec::Matchers.define :have_status_and_body do |status, body|
  match do |response|
    description { "returns a #{error['code']}" }
    expect(response.status).to eql status
    expect(JSON.load(response.body)).to include body
  end

  failure_message do |actual|
    expected_body = "body should be: #{body.as_json.pretty_inspect}"
    actual_body = "actual: #{JSON.load(actual.body).pretty_inspect}"

    "status should be #{status}, actual #{actual.status}\n" \
    "and #{expected_body}, #{actual_body}"
  end
end
