![Build Status](https://codeship.com/projects/1a688580-4d43-0135-028e-2a4961856651/status?branch=master)
![Code Climate](https://codeclimate.com/github/LukeRafferty/review_site.png)
![Coverage Status](https://coveralls.io/repos/LukeRafferty/review_site/badge.png)

# [Burgr](burgr.herokuapp.com)

Find the best burger restaurants in Boston with Burgr! Burgr let's you can create an account, upload a profile picture, write your own reviews, and vote on other reviews you see!

## Collaborators
* [LukeRafferty](https://github.com/LukeRafferty)
* [andy2012v](https://github.com/andy2012v)
* [cburges](https://github.com/cburges)
* [adamkgray](https://github.com/adamkgray)

## Technology
* Ruby on Rails
* React.js
* AWS
* Mailgunner
* Carrierwave
* Heroku

## Test Technology
* shoulda
* Capybara
* Jasmine / Enzyme for React.js

## How to get set it up
* `git clone`
* `bundle`
* `npm install`

* Obtain the necessary ENV keys for the [AWS Bucket](https://aws.amazon.com/), and if you want to seed, the [Yelp Api](https://www.yelp.com/developers)
* Add these lines to your `.env`
```
YELP_CLIENT_ID=
YELP_CLIENT_SECRET=
YELP_ACCESS_TOKEN=

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_BUCKET_DEVELOPMENT=
S3_BUCKET_PRODUCTION=
```

* `rake db:create && rake db:migrate && rake db:seed`

* `rake` to run the Ruby test suite
* `karma start` to run the React test suite

* `rails s`
* `npm start`



