namespace :project do
  desc "Generate default Projects"
  task :generate_default => :environment do
    10.times do |x|
      random_title = Faker::Lorem.sentence(3)
      random_client = Faker::Name.name
      random_body = Faker::Lorem.sentence(250)
      Project.create(title: random_title, client: random_client, body: random_body)
    end
  end




end
