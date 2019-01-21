#! /bin/sh
canary_version=$(grep version /tests/version.py | cut -d \" -f 2)
version=test
count=100
while [ $canary_version != $version ];
 do version=$(curl http://demoapp:5000/version)
 echo canary is $canary_version
 echo version is $version
 sleep 1
 count=$(( count-1 ))
 echo count is $count
 if [ $count -eq 0 ];
  then exit 1;
 fi;
done
