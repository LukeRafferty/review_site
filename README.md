![Build Status](https://codeship.com/projects/1a688580-4d43-0135-028e-2a4961856651/status?branch=master)
![Code Climate](https://codeclimate.com/github/LukeRafferty/review_site.png)
![Coverage Status](https://coveralls.io/repos/LukeRafferty/review_site/badge.png)

# [Burgr](https://burgr.herokuapp.com)

Find the best burger restaurants in Boston with Burgr! Burgr let's you can create an account, upload a profile picture, write your own reviews and vote on other reviews you see. Designed specifically to invoke the nostalgia, the color pallete of the website draws from the SNES classic Super Mario. But that's not all Burgr has to offer! With admin status, you can crete new retaurants and delete users too. Sign up and join us!

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

To begin, obtain the necessary ENV keys for the [AWS Bucket](https://aws.amazon.com/). You'll want to create both production and development buckets. Once you you have done so, add these lines to your `.env`
```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_BUCKET_DEVELOPMENT=
S3_BUCKET_PRODUCTION=
```

If you want to seed your database with 20 burger restaurants from Boston, sign up for the [Yelp Api](https://www.yelp.com/developers), and add the folowing lines your to `.env`
```
YELP_CLIENT_ID=
YELP_CLIENT_SECRET=
YELP_ACCESS_TOKEN=
```

Once you have all those things, you can continue with setup by running the following commands:
* `rake db:create && rake db:migrate && rake db:seed`
* `rake` to run the Ruby test suite
* `karma start` to run the React test suite

Enter `rails s` and `npm start`, then visit `localhost:3000` to see the site!



