```run app```
1. docker-compose run backend rake db:create db:migrate
2. docker-compose up --build
3. open in browser http://localhost:8080

```run rails console```
1. docker-compose run backend bash
2. rails c

```run specs```
1. docker-compose run backend rspec
