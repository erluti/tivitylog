describe Tivitylog::Logger do
  it 'sets the filename to todays date' do
    today = DateTime.now
    logger = described_class.new
    expect(logger.filename).to match(/activitylog.yaml$/)
    expect(logger.filename).to match(/^#{today.year}/)
    expect(logger.filename).to match(/^20\d\d\d?#{today.month}/)
    expect(logger.filename).to match(/^20\d\d\d\d0?#{today.day}/)
    # cleanup
    File.delete(logger.filename)
  end

  context 'with a tmp file' do
    before(:all) do
      Dir.mkdir 'tmp' unless File.directory?('tmp')
    end
    let(:file) { 'tmp/testlog.yaml' }
    after do
      File.delete(file) if File.exist?(file)
    end
    describe '#entry' do
      it 'is parsable yaml' do
        logger = described_class.new(filename: file)
        logger.entry({ something: 'value' })
        log = YAML.load_file(file)
        expect(log.count).to eq 1
      end
      it 'appends to the file' do
        logger = described_class.new(filename: file)
        logger.entry({ something: 'value' })
        logger.entry({ something: 'value2' })
        log = YAML.load_file(file)
        expect(log.count).to eq 2
      end
      it 'includes process data' do
        extra = { 'hello' => 'hi' }
        logger = described_class.new(extra, filename: file)
        logger.entry({ something: 'value' })
        log = YAML.load_file(file)
        expect(log.first['hello']).to eq extra['hello']
      end
    end
  end
end
