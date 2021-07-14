# README

* How to run the test suite

      rails db:migrate RAILS_ENV=test

      rails test

* Deployment instructions

      git clone https://github.com/Code-Exec/RailsAPI_test.git

      cd RailsAPI_test

      bundle install

      rake db:migrate

      rake db:seed    //optional, test dataset

      rails s

