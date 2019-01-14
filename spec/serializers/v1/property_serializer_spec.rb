describe V1::PropertySerializer do
  let(:lga) { Lga.create({ code: 311, name: 'CARDINIA'})}

  let(:property) { Property.create({id: 1234, 
  									council_property_number: 2188100300,
  									latitude: -37.9373447811622029,
  									longitude: 145.449895817713013,
  									lga_id: lga.id }) 
  }
 
  subject { V1::PropertySerializer.new(property) }
   
  it 'has id' do
    expect(subject.serializable_hash[:id]).to eq 1234
  end

  it 'has council_property_number' do
  	expect(subject.serializable_hash[:council_property_number]).to eq 2188100300
  end

  it 'has latitude' do
  	expect(subject.serializable_hash[:latitude]).to eq -37.9373447811622029
  end

  it 'has longitude' do
  	expect(subject.serializable_hash[:longitude]).to eq 145.449895817713013
  end

  it 'has lga' do
  	expect(subject.serializable_hash).to include(:lga)
  end

  it 'has address' do
  	expect(subject.serializable_hash).to include(:address)
  end
end