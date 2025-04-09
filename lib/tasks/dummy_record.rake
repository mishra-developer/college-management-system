namespace :db do
  desc "Create 5 dummy records for each model"
  task dummy_record: :environment do
    require 'faker'

    puts "Seeding ClassRooms..."
    class_rooms = 2.times.map do
      ClassRoom.create!(
        stream: Faker::Educator.subject,
        NumberOFStudent: rand(30..50),
        year: ClassRoom.years.keys.sample
      )
    end

    puts "Seeding Parents..."
    parents = 5.times.map do
      Parent.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        role: 'Parent',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
    end

    puts "Seeding Students..."
    students = 20.times.map do
      Student.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        role: 'Student',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        parent: parents.sample,
        class_room: class_rooms.sample
      )
    end

    puts "Seeding Teachers..."
    teachers = 2.times.map do
      Teacher.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        role: 'Teacher',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        subject_specialization: Faker::Educator.subject
      )
    end

    puts "Seeding Lectures..."
    lectures = 5.times.map do
      Lacture.create!(
        topic: Faker::Educator.course_name,
        start_time: Time.now + rand(1..5).days,
        end_time: Time.now + rand(6..10).days,
        teacher: teachers.sample,
        class_room: class_rooms.sample
      )
    end


    puts "Seeding Security Guards..."
    2.times do
      Security.create!(
        email: Faker::Internet.unique.email,
        password: 'password',
        role: 'Security',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        employee_id: "SEC#{rand(1000..9999)}"
      )
    end


    puts "Seeding Transports..."
    3.times do
      Transport.create!(
        vehicle_number: "MH#{rand(10..99)}AB#{rand(1000..9999)}",
        route: Faker::Address.street_name,
        type: %w[Bus Van Rickshaw].sample,
        college_id: rand(100..999).to_s
      )
    end

    puts "✅ Dummy data seeded successfully!"
  end
end
