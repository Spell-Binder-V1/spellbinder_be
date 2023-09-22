# Spellbinder 

**THIS IS MAGIC THE GATHERING ON RAILS**

*An application developed with Ruby on Rails*

Welcome to SpellBinder, the enchanting online haven for Magic: The Gathering enthusiasts. Dive into the vast world of MTG with our comprehensive card dictionary, where you can explore and discover the most elusive spells, creatures, and artifacts.

:magic_wand: Unleash Your Magic: Whether you're a seasoned veteran or just starting out, our user-friendly platform empowers you to explore, search, and curate your own collection of MTG cards effortlessly.

:sparkles: Deck Crafting Magic: Sign up for a free account and embark on your journey to deck mastery. Craft and save your custom decks with precision and ease, harnessing the power of thousands of cards to build the ultimate strategy.

:star2: Community of Players: Join a vibrant community of fellow MTG enthusiasts, share your deck creations, and seek advice from experienced players. Collaborate, discuss strategies, and take your MTG prowess to new heights.

:crystal_ball: Your Magic Awaits: SpellBinder is your portal to the mystical world of Magic: The Gathering. Discover, create, and conquer with us!

## Authors
- Matt Lim [GitHub](https://github.com/MatthewTLim) | [LinkedIn](https://www.linkedin.com/in/matthew-lim-va/)
- Derek Chavez [GitHub](https://github.com/DChavez18) | [LinkedIn](https://www.linkedin.com/in/derek-chavez/)
- Gabe Torres [GitHub](https://github.com/Gabe-Torres) | [LinkedIn](https://www.linkedin.com/in/gabe-torres-74a515269/)
- Brad Milton [GitHub](https://github.com/brad2412) | [LinkedIn](https://www.linkedin.com/in/bradley-milton-01a814132/)
- Jeff Nelson [GitHub](https://github.com/jpnelson85) | [LinkedIn](https://www.linkedin.com/in/jeff-nelson-307aba45/)

## Summary 
- [Getting Started](#getting-started)
- [Endpoints](#endpoints)
- [Test Suite](#test-suite)
- [Reflection](#reflection)
- [Developed With](#developed-with)
- [API JSON Contract](#api-json-contract)
- [Diagram between backend and frontend](#diagram-between-backend-and-frontend)
- [FRONTEND REPO LINK](https://github.com/Spell-Binder-V1/spell_binder_fe)

## Getting Started

**Schema**

```ruby
ActiveRecord::Schema[7.0].define(version: 2023_09_17_200123) do
  enable_extension "plpgsql"

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "cards", default: {"main_board"=>[], "side_board"=>[], "maybe_board"=>[]}
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "decks", "users"
end
```

 **Gems**
 ```ruby
    gem "faraday"
    gem 'jsonapi-serializer'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry"
  gem "rspec-rails"
  gem "capybara"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "faker"
  gem "vcr"
  gem "webmock"
  gem "simplecov"
end
 ```
 
 **Installing**
 - Fork and clone this repo
  - Run `bundle install`
  - Run `rails db:{create,migrate,seed}`
  - Run `rails s` to start the server
  - Open your browser and navigate to `localhost:3000`

## API JSON Contract
*Description of API endpoints for front end application*

<u> Collections </u>
- Description of Collections endpoints

> `GET /api/v0/collections`

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with a Collections list.
- Data Format: An array of collection objects, each containing "id", "type", and "attributes".
<!-- - Location:  -->
```ruby
{
    "data": [
        {
            "id": "1",
            "type": "collection",
            "attributes": {
                "code": "10E",
                "name": "Tenth Edition",
                "type": "core",
                "release_date": "2007-07-13",
                "block": "Core Set"
            }
        },
        {
            "id": "2",
            "type": "collection",
            "attributes": {
                "code": "2ED",
                "name": "Unlimited Edition",
                "type": "core",
                "release_date": "1993-12-01",
                "block": "Core Set"
            }
        },
        {
            "id": "3",
            "type": "collection",
            "attributes": {
                "code": "2X2",
                "name": "Double Masters 2022",
                "type": "masters",
                "release_date": "2022-07-08",
                "block": null
            }
        },
        {
          ....................................
        }
    ]
}
```

> `GET /api/v0/collections/:id`

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with list of the Collections cards.
- Data Format: A hash of card objects, each containing "id", "type", and "attributes".
<!-- - Location:  -->
```ruby
{
    "data": [
        {
            "id": "1",
            "type": "card",
            "attributes": {
                "id": 1,
                "multiverseid": "968",
                "name": "Abu Ja'far",
                "mana_cost": "{W}",
                "converted_mana_cost": 1.0,
                "colors": [
                    "W"
                ],
                "color_identity": [
                    "W"
                ],
                "type": "Creature — Human",
                "types": [
                    "Creature"
                ],
                "subtypes": [
                    "Human"
                ],
                "rarity": "Uncommon",
                "set": "ARN",
                "text": "When Abu Ja'far dies, destroy all creatures blocking or blocked by it. They can't be regenerated.",
                "artist": "Ken Meyer, Jr.",
                "number": "1",
                "power": "0",
                "toughness": "1",
                "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=968&type=card",
                "rulings": null
            }
        },
        {
            "id": "2",
            "type": "card",
            "attributes": {
                "id": 2,
                "multiverseid": "969",
                "name": "Army of Allah",
                "mana_cost": "{1}{W}{W}",
                "converted_mana_cost": 3.0,
                "colors": [
                    "W"
                ],
                "color_identity": [
                    "W"
                ],
                "type": "Instant",
                "types": [
                    "Instant"
                ],
                "subtypes": null,
                "rarity": "Common",
                "set": "ARN",
                "text": "Attacking creatures get +2/+0 until end of turn.",
                "artist": "Brian Snõddy",
                "number": "2",
                "power": null,
                "toughness": null,
                "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=969&type=card",
                "rulings": null
            }
        },
        ...................
    ]
}
```
---
<u> Random </u> 
- Description of Random endpoints

> `GET /api/v0/cards/random`

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with a random card.
- Data Format: An array of a single card object, containing "id", "type", and "attributes".
<!-- - Location: -->
```ruby
{
    "data": [
        {
            "id": "1",
            "type": "card",
            "attributes": {
                "id": 1,
                "multiverseid": "479367",
                "name": "Pack Rat",
                "mana_cost": "{1}{B}",
                "converted_mana_cost": 2.0,
                "colors": [
                    "B"
                ],
                "color_identity": [
                    "B"
                ],
                "type": "Creature — Rat",
                "types": [
                    "Creature"
                ],
                "subtypes": [
                    "Rat"
                ],
                "rarity": "Rare",
                "set": "SLD",
                "text": "Pack Rat's power and toughness are each equal to the number of Rats you control.\n{2}{B}, Discard a card: Create a token that's a copy of Pack Rat.",
                "artist": "Fiona Hsieh",
                "number": "35",
                "power": "*",
                "toughness": "*",
                "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=479367&type=card",
                "rulings": [
                    {
                        "date": "2012-10-01",
                        "text": "Pack Rat’s first ability counts any creature you control with the creature type Rat, not just Pack Rats."
                    },
                    {
                        "date": "2012-10-01",
                        "text": "The token will copy Pack Rat’s two abilities. Its power and toughness will be equal to the number of Rats you control (not the number of Rats you controlled when the token entered the battlefield). It will also be able to create copies of itself."
                    },
                    {
                        "date": "2012-10-01",
                        "text": "The token won’t copy counters on Pack Rat, nor will it copy other effects that have changed Pack Rat’s power, toughness, types, color, or so on. Normally, this means the token will simply be a Pack Rat. But if any copy effects have affected that Pack Rat, they’re taken into account."
                    },
                    {
                        "date": "2012-10-01",
                        "text": "If Pack Rat leaves the battlefield before its activated ability resolves, the token will still enter the battlefield as a copy of Pack Rat, using Pack Rat’s copiable values from when it was last on the battlefield."
                    }
                ]
            }
        }
    ]
}
```
---
<u> Cards </u>
- Description of Card endpoints

> `GET /api/v0/cards/:id`

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with a single card and it attributes.
- Data Format: A hash of card objects, each containing "id", "type", and "attributes".
<!-- - Location:  -->
```ruby
{
    "data": {
        "id": "1",
        "type": "card",
        "attributes": {
            "id": 1,
            "multiverseid": "600",
            "name": "Black Lotus",
            "mana_cost": "{0}",
            "converted_mana_cost": 0.0,
            "colors": null,
            "color_identity": null,
            "type": "Artifact",
            "types": [
                "Artifact"
            ],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
    }
}
```

<u> Register New</u>

> `GET /api/v0/register`

Client will see a form with the following attributes:

```ruby
{
    "data": {
      "id": "1",
      "type": "user",
      "attributes": {
        "user_name": "turing_test"
        "email": "turing_test@turing.edu"
        "password_digest": "password"
      }
    }
}
```

<u> Register Create </u>

> `POST /api/v0/register`

Client needs to supply the following attributes:

```ruby
      {
        "user_name": "turing_test"
        "email": "turing_test@turing.edu"
        "password_digest": "password"
      }
```

<u> Login New </u>

> `GET /api/v0/login`

Client will see a form with the following attributes:

```ruby
      {
        "user_name": "turing_test"
        "password_digest": "password"
      }
```

<u> Login Create </u>

> `POST /api/v0/login`

Client needs to supply the following attributes:

```ruby
      {
        "user_name": "turing_test"
        "password_digest": "password"
      }
```

<u> Logout Delete </u>

> `DELETE api/v0/logout`

```ruby
      {
        "message": "You are successfully logged out."
      }
```

<u> Search Get </u>

> `GET api/v0/search`

```ruby
{
    "data": 
      [{
        "id": "1",
        "type": "card",
        "attributes": {
            "id": 1,
            "multiverseid": "600",
            "name": "Black Lotus",
            "mana_cost": "{0}",
            "converted_mana_cost": 0.0,
            "colors": null,
            "color_identity": null,
            "type": "Artifact",
            "types": [
                "Artifact"
            ],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
      },
      {
        "id": "2",
        "type": "card",
        "attributes": {
            "id": 2,
            "multiverseid": "700",
            "name": "Whale",
            "mana_cost": "{R}",
            "converted_mana_cost": 10.0,
            "colors": [Red],
            "color_identity": [Red, Green],
            "type": "Artifact",
            "types": ["Artifact"],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
      }]
}
```

<u> Decks Index  </u>

> `GET api/v0/decks`

Deck has a card attribute that consist of 3 hashes: main_board, side_board, and maybe_board. Each hash contains an array of card objects.

```ruby
{
    "data": 
      [{
        "id": "1",
        "type": "deck",
        "attributes": {
            "name": "Deck #1",
            "user_id": 1
        }
      },
      {
        "id": "2",
        "type": "deck",
        "attributes": {
            "name": "Deck #2",
            "user_id": 1
        }
      }]
}

{
    "data": 
      [{
        "id": "1",
        "type": "deck_card",
        "attributes": {
            "deck_id": 1,
            "card_id": 1,
            "created_at": "09-01-2023"
        }
      },
      {
        "id": "2",
        "type": "deck_card",
        "attributes": {
            "deck_id": 2,
            "card_id": 2,
            "created_at": "09-05-2023"
        }
      }]
}

{
    "data": 
      [{
        "id": "1",
        "type": "card",
        "attributes": {
            "id": 1,
            "multiverseid": "600",
            "name": "Black Lotus",
            "mana_cost": "{0}",
            "converted_mana_cost": 0.0,
            "colors": null,
            "color_identity": null,
            "type": "Artifact",
            "types": [
                "Artifact"
            ],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
      },
      {
        "id": "2",
        "type": "card",
        "attributes": {
            "id": 2,
            "multiverseid": "700",
            "name": "Whale",
            "mana_cost": "{R}",
            "converted_mana_cost": 10.0,
            "colors": [Red],
            "color_identity": [Red, Green],
            "type": "Artifact",
            "types": ["Artifact"],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
      }]
}
```
# ! need to update to reflect new card attributes

<u> Decks Show, Create, Update, and Delete </u>

> `GET api/v0/decks/:id`

> `POST api/v0/decks/:id`

> `PATCH api/v0/decks/:id'`

> `DELETE api/v0/decks/:id`

<!-- Deck has a many-to-many relationship with Card and Deck_card is the join table. -->
```ruby
{
    "data": 
      {
        "id": "1",
        "type": "deck",
        "attributes": {
            "name": "Deck #1",
            "user_id": 1
        }
      }
}

{
    "data": 
      {
        "id": "1",
        "type": "deck_card",
        "attributes": {
            "deck_id": 1,
            "card_id": 1,
            "created_at": "09-01-2023"
        }
      }
}

{
    "data": 
      {
        "id": "1",
        "type": "card",
        "attributes": {
            "id": 1,
            "multiverseid": "600",
            "name": "Black Lotus",
            "mana_cost": "{0}",
            "converted_mana_cost": 0.0,
            "colors": null,
            "color_identity": null,
            "type": "Artifact",
            "types": [
                "Artifact"
            ],
            "subtypes": null,
            "rarity": "Rare",
            "set": "2ED",
            "text": "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
            "artist": "Christopher Rush",
            "number": "233",
            "power": null,
            "toughness": null,
            "image_url": "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=600&type=card",
            "rulings": null
        }
      }
} -->
```

<u> Sad Path Error Handling </u>

```ruby
{
  "errors": [
    {
      "detail": error
    }
  ]
}
```


# Routes

| Action | Route |
| ----------- | ----------- |
| get | '/api/v0/collections' |
| get | '/api/v0/collections/:id' |
| get | '/api/v0/cards/random' |
| get | '/api/v0/cards/:id' |
| get | '/api/v0/register' |
| post | '/api/v0/register |
| get | '/api/v0/login' |
| post | '/api/v0/login' |
| delete | '/api/v0/logout' |
| get | 'api/v0/search' |
| get | '/api/v0/decks' |
| get | '/api/v0/decks/:id |
| post | '/api/v0/decks/:id' |
| patch | '/api/v0/decks/:id' |
| delete | '/api/v0/decks/:id' |



# Test Suite
 - run `bundle exec rspec` to run the test suite

**HappyPath**

```ruby
describe "#index" do
    it "returns happy path for collections" do
      get "/api/v0/collections"
      expect(response).to be_successful
      collections_data = JSON.parse(response.body)

      expect(collections_data).to have_key("data")

      collections = collections_data["data"]
      collections.each do |collection|

        attributes = collection["attributes"]
        expect(attributes).to have_key("code")

        expect(attributes["code"]).to be_a(String)
        expect(attributes).to have_key("name")
        expect(attributes["name"]).to be_a(String)
        expect(attributes).to have_key("type")
        expect(attributes["type"]).to be_a(String)
        expect(attributes).to have_key("release_date")
        expect(attributes["release_date"]).to be_a(String)
        expect(attributes).to have_key("block")
        expect(attributes["block"]).to be_a(String).or be(nil)
      end
      expect(response.status).to eq(200)
    end
  end
```

```ruby
context 'GET /search happy & sad' do
    scenario "returns http success" do
      card_search_params = ({q: "Black Lotus"})

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v0/search", headers: headers, params: card_search_params

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
```
---

**SadPath**

```ruby 
scenario "returns http not found" do
      card_search_params = ({q: "Holo Ghost Face Pikachu"})

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v0/search", headers: headers, params: card_search_params
      
      error = JSON.parse(response.body)
      expect(response).to have_http_status(:not_found)
      expect(response.status).to eq(404)
      expect(error["error"]).to eq("No cards found")
    end
  end
```

```ruby
describe "Sad path/Edge case" do
    it "returns empty if user has no decks" do
      user = User.create!(username: 'UniqueUsername', email: 'unique@example.com', password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

    get api_v0_decks_path

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to include('application/json')

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.count).to eq(0)
    end
```

## Reflection

During the development of our Ruby on Rails application Spellbinder, we had the opportunity to work on an exciting and challenging project that combined aspects of web development, including API integration, database design, user authentication, and frontend development/backend development. This reflection highlights key aspects of our work and the lessons learned during the development of Spellbinder.

<u> API Integration: </u>

One of the core features of our application was to dynamically fetch and manipulate card data from the Magic: The Gathering API.
Implementing this functionality required a understanding of API requests, JSON parsing, and data storage.
It was challenging to create a system that could store card information in real-time while minimizing API requests to avoid store all the cards in the database.

<u>Creating Endpoints: </u>

One of the standout features of our application was the ability to generate custom API endpoints.
This required careful consideration of routing and MVC design.
We implemented a system that allowed users to define their own endpoints based on specific search criteria, collections, and random card selection.
This added a unique dimension to our application and demonstrated the power of Rails in creating APIs, and manipulating data.

<u>Frontend Development: </u>

Developing the frontend of our application was equally crucial as our backend development.
We created a separate frontend app that interacted with our Rails API from the backend.
This frontend was responsible for presenting the data to users in an user-friendly manner.
We used modern frontend technologies like Bootstrap and CORS to create a responsive and interactive user interface.

<u>User Authentication:* </u>

To enable users to create accounts and save their decks, we implemented user authentication through Google OAuth and OmniAuth.
This involved building a secure authentication system, including user registration, login, and password functionality.
It was important to ensure data security and protect user accounts so that users could safely store their decks and card collections.

<u>Database Design: </u>

Our database consisted of two main tables: users and decks.
The decks table contained card data as an attribute, and held a hash that stored the cards in the main board, side board, and maybe board arrays.
We used database migrations and models to define the structure of our database, ensuring efficient storage and retrieval of information and deletion of data.

<u>Lessons Learned: </u>

*Throughout this project, We learned several valuable lessons:*

API: We gained experience in handling API requests and parsing JSON data. I learned how to use the Faraday gem to make API requests and how to parse the JSON data into Ruby objects. 
We also learned how to use the JSONAPI gem to format the JSON data into a format that was easy to manipulate and use in the frontend. 

Flexibility in Routing: Building dynamic endpoints required a deep understanding of Rails routing and controller customization. It underscored the importance routing and MVC design in creating a scalable application.

Frontend-Backend Separation: Separating the frontend and backend allowed us to create a more maintainable and scalable application. It also improved collaboration among frontend and backend teams, allowing us to work on different aspects of the application simultaneously.

User-Centric Design: Prioritizing user needs and designing a user-friendly interface was critical for the success of our application. 

Data Security: Implementing user authentication highlighted the importance of data security and user privacy. 

In conclusion, working on this Ruby on Rails application was a challenging yet awarding experience. It brought together various aspects of web development, challenging us to create a dynamic application. The project allowed us to expand our knowledge and skills in API integration, database design, frontend development, and user authentication, and it provided valuable lessons that will guide us in future endeavors.

---
## Diagram between backend and frontend

![Alt text](image.png)

---
# Developed With
---

<img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo"><img src="https://user-images.githubusercontent.com/127896538/267407283-0389dace-15c6-493c-a3b7-3a833f0a20f2.png" width="50" alt="Rails Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/figma/figma-original.svg" width="50" alt="Figama Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/heroku/heroku-original-wordmark.svg" width="50" alt="heroku Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/github/github-original.svg" width="50" alt="github Logo"><img src="https://user-images.githubusercontent.com/127896538/267406979-5e0db686-91a1-42ee-9bda-675a5c5c2266.png" width="50" alt="Ruby Logo"><img  src='https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg' width='50' alt='sql'><img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo">
