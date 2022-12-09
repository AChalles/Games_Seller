# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




# https://api.rawg.io/api/games?key=bbc9bcd78eb64724aa0915ce125edc6b

Game.delete_all
Genre.delete_all
Company.delete_all
AdminUser.delete_all

#uncomment this line if you delete the database.
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

increment = 1
5.times do
  gamesapi = "https://api.rawg.io/api/games?key=bbc9bcd78eb64724aa0915ce125edc6b&page=#{increment}"
  response = RestClient.get gamesapi
  games = JSON.parse response
  if !games.nil?
    games["results"].each do |g|
      # puts g["id"]
      gameapi = "https://api.rawg.io/api/games/#{g["id"]}?key=bbc9bcd78eb64724aa0915ce125edc6b"
      response = RestClient.get gameapi
      api = JSON.parse response

      genre = Genre.find_or_create_by(name: g["genres"][0]["name"])

      company = Company.find_or_create_by(name: api["developers"][0]["name"])
      # puts api["developers"][0]["name"]
      if genre && genre.valid?
        game = genre.games.create(
          name:         g["name"],
          description:  api["description_raw"],
          publish_date:  g["released"],
          price:  rand(2099..7999).to_i,
          company: company
        )
      end
    end
  end
  increment = increment + 1
end