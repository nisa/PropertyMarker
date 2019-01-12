require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def load_fixture(name)
  File.read(Rails.root.join('db', 'fixtures', "#{name}.csv"))
end

def parse_csv(csv_text)
  CSV.parse(csv_text, headers: true)
end

def seed_from_fixture(name, foreign_keys = {}, fixture_references = {}, column_map = {})
  puts "Creating #{name.titleize}"
  model = name.singularize.camelize.constantize
  fixture = parse_csv(load_fixture(name))
  fixture.each do |row|
    attributes = row.to_hash.slice(*model.attribute_names)
    find_references(foreign_keys, fixture_references, column_map, row, attributes)
    model.find_or_create_by(attributes)
  end
  puts 'Done'
end

# foreign_keys => { lga: 'lga_id', feature: 'feature_id' }
# fixture_references => { lga_id: 'lga_code', feature_id: 'id' }
# column_map => { lga_code: 'code'}
def find_references(foreign_keys, fixture_references, column_map, row, attributes)
  foreign_keys.each do |k, v|
    model = k.to_s.camelize.constantize
    name_in_fixture = fixture_references.with_indifferent_access[v]
    attribute_name = column_map.with_indifferent_access[name_in_fixture]
    reference = model.find_by( attribute_name => row[name_in_fixture])
    attributes.merge!(v =>reference.try(:id))
  end
  attributes
end

seed_from_fixture('lgas')
seed_from_fixture('properties', { lga: 'lga_id' }, { lga_id: 'lga_code' }, {lga_code: 'code'})
seed_from_fixture('addresses', { lga: 'lga_id' }, { lga_id: 'lga_code' }, {lga_code: 'code'})