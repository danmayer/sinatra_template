web: bundle exec shotgun -p $PORT
redis: leader --unless-port-in-use 6379 "redis-server > log/redis.log"
log: touch log/sinatra.log; tail -f log/sinatra.log