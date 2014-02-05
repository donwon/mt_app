namespace :project do
  desc "Generate default Projects"
  task :generate_default => :environment do
    10.times do |x|
      random_title = Faker::Lorem.sentence(3)
      random_client = Faker::Name.name
      random_body = Faker::Lorem.sentence(300)

      random_pw = "fakepassword"
      random_email = Faker::Internet.email
      project = Project.new(title: random_title, client: random_client, body: random_body)
      
      user = User.create(password: random_pw, email: random_email)
      user.projects << project

    end
  end




end
