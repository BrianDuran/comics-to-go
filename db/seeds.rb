char1 = Character.create([{name: 'Spiderman', company: 'Marvel'}])
char2 = Character.create([{name: 'Wolverine', company: 'Marvel'}])
char3 = Character.create([{name: 'Batman',    company: 'DC'}])
char4 = Character.create([{name: 'Ironman',   company: 'Marvel'}])
char5 = Character.create([{name: 'Spawn',     company: 'Marvel'}])
char6 = Character.create([{name: 'Aquaman',   company: 'Marvel'}])
char7 = Character.create([{name: 'Kickass',  	company: 'Icon'}])

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char1.first.id,
                condition: 'Mint'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char2.first.id,
                 condition: 'New'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char3.first.id,
                 condition: 'Rare'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char4.first.id,
                 condition: 'Un-open'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char5.first.id,
                 condition: 'Vintage'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char6.first.id,
                 condition: 'Collectable'}])
end

for i in 1..6
  Comic.create([{name: Faker::Address.street_name, release_date: DateTime.now, character_id: char7.first.id,
                 condition: 'Original'}])
end
