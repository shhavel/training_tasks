# frozen_string_literal: true

RSpec::Matchers.define(:be_one_of) do |*expected|
  match do |actual|
    expected.include?(actual)
  end

  failure_message do |actual|
    "expected one of #{expected}, got #{actual}"
  end
end

RSpec.configure do |config|
  config.default_formatter = 'doc' if config.files_to_run.one?
end
