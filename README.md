# Tier 3 Tech Quiz

To get started:

## Run the project using Docker (preferred)
```
bash ./docker-start.sh
# Navigate to http://localhost:3000/
```

### Start Rails console
```
docker exec -it  -u rails t3tq /bin/bash --login
bundle exec pry -r ./config/environment
```

## On your local machine (harder)

### If on a Mac, do these first

```
brew install rvm
rvm install ruby-3.3.0
rvm use ruby-3.3.0
```

### For Linux or other, follow the above steps translating to your computer's operating system

### Once the right version of ruby is in place (3.3.0), run these steps

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

