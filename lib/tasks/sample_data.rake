namespace :db do 
  desc "Fill database with sample date" 
  task populate: :environment do 
    User.create!(firstname: "Michael", 
                 lastname: "McDevitt",
                 username: "mmcdevi1",
                 email: "mmcdevi1@gmail.com",
                 password: "koplop",
                 password_confirmation: "koplop",
                 admin: true,
                 type_of_user: "broker")
   
    

    PropertyType.create!(name: "office")
    PropertyType.create!(name: "retail")
    PropertyType.create!(name: "industrial")
    PropertyType.create!(name: "mixed-use")
    
  end
end