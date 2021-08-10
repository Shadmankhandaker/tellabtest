#!/bin/bash

# On ubuntu, mongo seems to be started automatically, but not on
# mac mini...

# On the chromebook, there is very little free space...
# smallfiles option is necessary on chromebook because of limited storage!?
echo start_mongo.sh:  option smallfiles used for chromebook
echo 'Disabling journalling!!!'
mongod --smallfiles --nojournal 2> mongod_errors > mongod_output &


