Department.create!(dept_name: "Business Adminstration")
cse = Department.create!(dept_name: "Computer Science and Engineering")
Department.create!(dept_name: "Biotechnology")
Department.create!(dept_name: "Civil Engineering")

#Seed Students
count = 69

15.times do 
  count = count + 1;
  student_id = "ITITIU140" + "#{count}"
  password = "password"
  student = User.create!(user_id: student_id, 
	          password: password, 
	          password_confirmation: password,
	          is_a:"student")

  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  dob = Faker::Date.birthday(18)
  email = Faker::Internet.email

  student.create_generalinfo(first_name: first_name, 
  	last_name: last_name, 
  	phone_number: phone_number,
  	dob: dob,
  	email: email)
  student.create_student(department_id:2)

end

#Seed Lecturers
5.times do |n|
  lecturer_id = "ITLECTURER" + "#{n+1}"
  password = "password"
  lecturer = User.create!(user_id: lecturer_id, 
	          password: password, 
	          password_confirmation: password,
	          is_a:"lecturer")

  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  dob = Faker::Date.birthday(18,19)
  email = Faker::Internet.email

  lecturer.create_generalinfo(first_name: first_name, 
  	last_name: last_name, 
  	phone_number: phone_number,
  	dob: dob,
  	email: email)
  lecturer.create_lecturer(department_id:2)
end

#Seed Courses

cse.courses.create!(
	course_id: "IT097IU", 
	title: "Introduction to Artificial Intelligence", 
	credits: 4)
cse.courses.create!(
	course_id: "IT092IU", 
	title: " Principles of Programming Languages", 
	credits: 4)
cse.courses.create!(
	course_id: "IT090IU", 
	title: "Object-Oriented Analysis and Design", 
	credits: 4)
cse.courses.create!(
	course_id: "IT116IU", 
	title: "C/C++ Programming in Unix", 
	credits: 4)
cse.courses.create!(
	course_id: "IT096IU", 
	title: "Net-Centric Programming", 
	credits: 4)

#Seed Teaches
5.times do |n|
Teach.create(lecturer_id: n+1, course_id: n+1)
end