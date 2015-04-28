task :clean_image => :environment do
  avatars = Avatar.all
  avatars = avatars.select{|a| a.event.nil?&&a.user.nil?}
  avatars.map(&:destroy)
end
