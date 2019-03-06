# frozen_string_literal: true

require "spec_helper"

describe App do
  subject { described_class }

  it { expect(subject.run) }
end
