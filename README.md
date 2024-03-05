# Tier 3 Tech Quiz

To get started:

## On your local computer

```
bundle install
bundle exec rake db:refresh
bundle exec rails server
# Navigate to http://localhost:3000/
```

### Start Rails console
```
bundle exec pry -r ./config/environment
```

## Via Docker
```
docker build -t teachstone:tier3-tech-quiz .
docker run -v $PWD:/rails --name=t3tq --env-file ./env-for-testing-purposes -p 3000:3000 teachstone:tier3-tech-quiz
# Navigate to http://localhost:3000/
```

### Start Rails console
```
docker exec -it  -u rails t3tq /bin/bash --login
bundle exec pry -r ./config/environment
```

