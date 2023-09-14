# Spellbinder 

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
- [Postman](#postman)

## Getting Started

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

> `GET /api/v0/random`

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


# Routes
| Action | Route |
| ----------- | ----------- |
| get | '/api/v0/collections' |
| get | '/api/v0/collections/:id' |
| get | '/api/v0/cards/random' |
| get | '/api/v0/cards/:id' |


# Test Suite
 - run `bundle exec rspec` to run the test suite

**HappyPath**

**SadPath**

## Reflection

## Postman
**Postman happy request to Heroku**

**Postman Happy Response**
<!-- **screenshot of postman happy-response** -->

**Postman sad request to Heroku**

**Postman Sad Response**
<!-- **screenshot of postman sad-response** -->

# Developed With
---

<img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo"><img src="https://user-images.githubusercontent.com/127896538/267407283-0389dace-15c6-493c-a3b7-3a833f0a20f2.png" width="50" alt="Rails Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/figma/figma-original.svg" width="50" alt="Figama Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/heroku/heroku-original-wordmark.svg" width="50" alt="heroku Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/github/github-original.svg" width="50" alt="github Logo"><img src="https://user-images.githubusercontent.com/127896538/267406979-5e0db686-91a1-42ee-9bda-675a5c5c2266.png" width="50" alt="Ruby Logo"><img  src='https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg' width='50' alt='sql'><img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo">
