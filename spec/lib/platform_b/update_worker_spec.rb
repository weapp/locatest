# frozen_string_literal: true

require "spec_helper"

describe PlatformB::UpdateWorker do
  describe "failure from network" do
    before do
      expect(::PlatformB::Client.instance).to receive(:request)
        .and_return(OpenStruct.new(status: 404, body: ""))
    end

    it "raises an error (retry it)" do
      expect { described_class.new.perform({}) }.to raise_error(Base::UpdateWorker::Retry)
    end
  end

  describe "success from network" do
    before do
      expect(::PlatformB::Client.instance).to receive(:request)
        .and_return(OpenStruct.new(status: 200, body: platform_b_success_response))
    end

    it "not raises an error" do
      expect { described_class.new.perform({}) }.not_to raise_error(Base::UpdateWorker::Retry)
    end
  end
end
