# frozen_string_literal: true

require "spec_helper"

describe Base::Response do
  describe "errored response" do
    subject { described_class.new(:ok, "data") }

    it { is_expected.to be_ok }
    it { is_expected.not_to be_error }
    it { expect(subject.data).not_to be_nil }
    it { expect(subject.error).to be_nil }

    it "ok_then execute block" do
      expect { |b| subject.ok_then(&b) }.to yield_with_args("data")
    end

    it "error_then not execute block" do
      expect { |b| subject.error_then(&b) }.not_to yield_with_args("data")
    end
  end

  describe "success response" do
    subject { described_class.new(:error, "data") }

    it { is_expected.not_to be_ok }
    it { is_expected.to be_error }
    it { expect(subject.data).to be_nil }
    it { expect(subject.error).not_to be_nil }

    it "ok_then not execute block" do
      expect { |b| subject.ok_then(&b) }.not_to yield_with_args("data")
    end

    it "error_then execute block" do
      expect { |b| subject.error_then(&b) }.to yield_with_args("data")
    end
  end
end
