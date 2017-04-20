User.create!(user_id: "ITITIU14070", 
	          password:"quangnhat", 
	          password_confirmation:"quangnhat",
	          is_a:"student")
Department.create!(dept_name: "Business Adminstration")
Department.create!(dept_name: "Computer Science and Engineering")
Department.create!(dept_name: "Biotechnology")
Department.create!(dept_name: "Civil Engineering")
count = 70
25.times do |n|
  count = count + 1;
  user_id = "ITITIU140" + "#{count}"
  password = "password"
  user = User.create!(user_id: user_id, 
	          password: password, 
	          password_confirmation: password,
	          is_a:"student")

  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  dob = Faker::Date.birthday(18)
  email = Faker::Internet.email

  user.create_generalinfo(first_name: first_name, 
  	last_name: last_name, 
  	phone_number: phone_number,
  	dob: dob,
  	email: email)
  user.create_student(department_id:2)

end