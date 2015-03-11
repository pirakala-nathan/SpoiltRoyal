# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

admin = User.create(
    username: "admin",
    email: "test@syncidlabs.com",
    password: "admin",
    password_confirmation: "admin",
    account_id: "1",
    account_type: "Vendor",
    first_name: "John",
    last_name: "Smith",
    admin: true
)

@test = User.create(
  username: "test",
  email: "infosyncidlabs@gmail.com",
  password: "test",
  password_confirmation: "test",
  account_type: "Consumer", 
  first_name: "Alex",
  last_name: "Smith",
  admin: false
)

test1 = User.create(
  username: "test1",
  email: "user1@test.com",
  password: "test",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test2 = User.create(
  username: "test2",
  email: "user2@test.com",
  password: "test",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)


TimedTask.create(interval: 1, measure_of_time: "minute")

EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: test)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: test1)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: test2)

Vendor.create(business_name: "SyncI&DLabs", business_name: "Lorem ipsum",
              establish_date: Date.today, tax_number: 1234)
@v.user = admin
@v.save
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
  PaymentMethod.create(name: "PaymentMethod_" + i.to_s)
end

@first_post = Post.create(
  title: "Need a Waitress",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-02-27",
)

@second_post = Post.create(
  title: "Need a Cook",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-02-27",
)
@third_post = Post.create(
  title: "Need a Gaurd",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-02-27",
)
first_sub = PostSubscription.create(
  post_id: @first_post.id,
  category_id: 1,
  subcategory_id: 1,
  )

second_sub = PostSubscription.create(
  post_id: @second_post.id,
  category_id: 2,
  subcategory_id: 4,
  )
third_sub = PostSubscription.create(
  post_id: @third_post.id,
  category_id: 3,
  subcategory_id: 7,
  )
