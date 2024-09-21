# require 'spec_helper'

describe Tivitylog::Logger do
  it 'sets the filename to todays date' do
    today = DateTime.now
    logger = described_class.new
    expect(logger.filename).to match(/activitylog.yaml$/)
    expect(logger.filename).to match(/^#{today.year}/)
    expect(logger.filename).to match(/^20\d\d\d?#{today.month}/)
    expect(logger.filename).to match(/^20\d\d\d\d0?#{today.day}/)
  end
end
