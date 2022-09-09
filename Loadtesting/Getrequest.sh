#!/bin/sh


PROFILE=${AWS_PROFILE=quangcao@nephometrics}

ip=$(aws ec2 describe-instances --profile=$PROFILE --filters "Name=instance-state-name,Values=running" "Name=instance-id,Values=i-0f3346ad6e6273924" --query 'Reservations[*].Instances[*].[PublicIpAddress]' --output text)

echo "your public ip is $ip"

while :

do

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 3ozteg4i3ifixq6axsmtrbqonw' &

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 6g9scfgsg7b97qho1jdq1zrzqh' &

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 1ut15z6dmpytdc4j3mzsriypmr' &

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer bjnuyzu7hjybm86r8theacmmzo' &

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 5kpesg6au7fpjkrapcioz3atte' &

curl --location --request GET "http://$ip/api/v4/channels/uftzbofxe7ngzytsf7z9599cgw/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 83pccughj3b4xgwnttqm5i8i7a' &



curl --location --request GET "http://$ip/api/v4/channels/6daa68bxqt8cmqscsqics9dd8w/posts?page=0&per_page=1" \
--header 'Authorization: Bearer j3gnyf1mkjdrxkafe8qtjof5hh' &

curl --location --request GET "http://$ip/api/v4/channels/6daa68bxqt8cmqscsqics9dd8w/posts?page=0&per_page=1" \
--header 'Authorization: Bearer wzs4yy73o7nmjmnitnbriw9gcw' &

curl --location --request GET "http://$ip/api/v4/channels/6daa68bxqt8cmqscsqics9dd8w/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 3tuq5sgoi7dyjpkod97z5g4o4o' &

curl --location --request GET "http://$ip/api/v4/channels/6daa68bxqt8cmqscsqics9dd8w/posts?page=0&per_page=1" \
--header 'Authorization: Bearer 9yi5skitnjfffk96u43bwufakc' &


sleep 1

done
