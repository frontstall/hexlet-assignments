namespace :hexlet do
  desc 'Loads users from csv to database'
  task :import_users, [:filepath] => :environment do |_t, args|
    filepath = Rails.root.join(args[:filepath])

    raise 'File doesn\'t exist' unless File.exist? filepath

    content = File.read filepath
    _, *strings = content.split("\n")
    strings.each do |str|
      first_name, last_name, birthday, email = str.split(',')
      birthday = Date.strptime(birthday, '%m/%d/%Y')
      puts "Adding user with first name #{first_name}, last name #{last_name}, bday: #{birthday}"
      User.create! first_name:, last_name:, birthday:, email:
    end
  end
end
