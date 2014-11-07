# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# 

admin = User.create(
    username: "admin",
    email: "admin@nex.com",
    password: "123123",
    password_confirmation: "123123",
    account_type: "Vendor",
    admin: true
)

c = Country.create([{name: 'Canada'}])
p = Province.create([
  {name: 'Ontario', country_id: c.first.id},
  {name: 'Quebec', country_id: c.first.id}])
City.create([
  {name: 'Toronto', province_id: p.first.id},
  {name: 'Waterloo', province_id: p.first.id},
  {name: 'Kitchener', province_id: p.first.id},
  {name: 'Quebec City', province_id: p[1].id},
  {name: 'Montreal', province_id: p[1].id}])

for i in 1..3 do
  ind = Industry.create(name: "industry_" + i.to_s)
  for j in 1..3 do
    cat = Category.create(name:  "category_" + i.to_s + "_" + j.to_s, industry_id: ind.id)
    for k in 1..3 do
      ext = i.to_s + "_" + j.to_s + "_" + k.to_s
      Subcategory.create(name: "sub-cat_" + ext, tip: "tip_" + ext, category_id: cat.id)
    end
  end
end

for i in 1..5 do
  ExternalSource.create(source_type: "Source_Type_" + i.to_s)
end