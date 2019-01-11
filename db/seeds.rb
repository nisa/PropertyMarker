require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def load_fixture(name)
  File.read(Rails.root.join('db', 'fixtures', "#{name}.csv"))
end

def parse_csv(csv_text)
  CSV.parse(csv_text, headers: true)
end

def seed_from_fixture(name:,foreign_keys:, fixture_references:)
  "Creating #{name.titleize}"
   model ||= Kernel.const_get name.singularize.camelize
   fixture = parse_csv(load_fixture(name))
   fixture.each do |row|
   	 binding.pry
     row.filter(model.attributes)
     #find_or_create_references(foreign_keys, fixture_references, row)
   end
end

# foreign_keys => { lga: lga_id, feature: feature_id }
# fixture_references => { lga_id: lga_code, feature_id: id }
def find_or_create_references(foreign_keys, fixture_references, fixture_row)
  foreign_keys.each do |k, v|
    model = Kernel.const_get k.camelize
    reference = model.find_or_create_by(v: fixture_references[v])
    {v: reference.id}
  end
end

seed_from_fixture(name: 'addresses', foreign_keys: {lga: 'lga_id', feature: 'feature_id'},
fixture_references: { lga_id: 'lga_code', feature_id: 'id'})