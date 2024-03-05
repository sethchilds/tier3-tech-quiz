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
bash ./docker-start.sh
# Navigate to http://localhost:3000/
```

### Start Rails console
```
docker exec -it  -u rails t3tq /bin/bash --login
bundle exec pry -r ./config/environment
```

