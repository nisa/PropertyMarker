describe V1::LgaSerializer do
  let(:lga) { Lga.create({ code: 311, name: 'CARDINIA'})}

 
  subject { V1::LgaSerializer.new(lga) }
   
  it 'has council' do
    expect(subject.serializable_hash[:council]).to eq 'CARDINIA'
  end
end