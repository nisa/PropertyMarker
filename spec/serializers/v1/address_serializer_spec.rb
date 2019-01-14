describe V1::AddressSerializer do
  let(:address) { Address.create({ property_id: 1234, 
   	                               full_address: '8 CLOVERLEIGH AVENUE EMERALD 3782',
   	                               postcode: 3782})
  }
  subject { V1::AddressSerializer.new(address) }
   
  it 'has full_address' do
    expect(subject.serializable_hash[:full_address]).to eq '8 CLOVERLEIGH AVENUE EMERALD 3782'
  end

  it 'has postcode' do
  	expect(subject.serializable_hash[:postcode]).to eq 3782
  end
end