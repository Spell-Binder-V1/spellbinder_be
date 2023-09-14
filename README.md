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
**Description of API endpoints for front end application**

## Routes
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
**screenshot of postman happyresponse**

**Postman sad request to Heroku**

**Postman Sad Response**
# Developed With
---

<img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo"><img src="https://user-images.githubusercontent.com/127896538/267407283-0389dace-15c6-493c-a3b7-3a833f0a20f2.png" width="50" alt="Rails Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/figma/figma-original.svg" width="50" alt="Figama Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/heroku/heroku-original-wordmark.svg" width="50" alt="heroku Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/github/github-original.svg" width="50" alt="github Logo"><img src="https://user-images.githubusercontent.com/127896538/267406979-5e0db686-91a1-42ee-9bda-675a5c5c2266.png" width="50" alt="Ruby Logo"><img  src='https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg' width='50' alt='sql'><img src="https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest?cb=20140813141013" width="50" alt="Magic Logo">
