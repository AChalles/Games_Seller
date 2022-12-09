# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




# https://api.rawg.io/api/games?key=bbc9bcd78eb64724aa0915ce125edc6b



def seed_admin
  User.delete_all
  AdminUser.delete_all
  #uncomment this line if you delete the database.
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end


def seed_games
Game.delete_all
Genre.delete_all
Company.delete_all
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
end

def seed_provinces
  Province.delete_all
  Province.create(
    name: "Alberta",
    abbr: "AB",
    pst: 0,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "British Columbia",
    abbr: "BC",
    pst: 0.07,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "Manitoba",
    abbr: "MB",
    pst: 0.07,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "New Brunswick",
    abbr: "NB",
    pst: 0,
    hst: 0.15,
    gst: 0
  )

  Province.create(
    name: "Newfoundland and Labrador",
    abbr: "NL",
    pst: 0,
    hst: 0.15,
    gst: 0
  )

  Province.create(
    name: "Northwest Territories",
    abbr: "NT",
    pst: 0,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "Nova Scotia",
    abbr: "NS",
    pst: 0,
    hst: 0.15,
    gst: 0
  )

  Province.create(
    name: "Nunavut",
    abbr: "NU",
    pst: 0,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "Ontario",
    abbr: "ON",
    pst: 0,
    hst: 0.13,
    gst: 0
  )

  Province.create(
    name: "Prince Edward Island",
    abbr: "PE",
    pst: 0,
    hst: 0.15,
    gst: 0
  )

  Province.create(
    name: "Quebec",
    abbr: "QB",
    pst: 0.0975,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "Saskatchewan",
    abbr: "SK",
    pst: 0.06,
    hst: 0,
    gst: 0.05
  )

  Province.create(
    name: "Yukon",
    abbr: "YK",
    pst: 0,
    hst: 0,
    gst: 0.05
  )


end

def seed_pages
  Page.delete_all
  Page.create(
    title: "About",
    content:"",
    permalink:"about"
  )

  Page.create(
    title: "Contact",
    content: "",
    permalink: "contact"
  )
end

#seed_admin();
#seed_games();
#seed_provinces();
seed_pages();