require_relative '../data_parser'

describe DataParser do
  it 'parses an empty file' do
    parser = DataParser.new(data: '[]')

    expect(parser.parse).to be_empty
  end

  it 'parses a file with only one element' do
    parser = DataParser.new(data: '[{"example": "test"}]' )

    expect(parser.parse.size).to eq 1
  end

  it 'parses a real file' do
    data_from_file = File.read('spec/fixtures/data.json')
    parser = DataParser.new(data: data_from_file)

    expect(parser.parse.size).to eq 2892
    expect(parser.parse.first).to be_a(Entry)
    expect(parser.parse.first.cohort).to eq "B"
  end
end
