#!/bin/sh


PROFILE=${AWS_PROFILE=quangcao@nephometrics}

ip=$(aws ec2 describe-instances --profile=$PROFILE --filters "Name=instance-state-name,Values=running" "Name=instance-id,Values=i-0f3346ad6e6273924" --query 'Reservations[*].Instances[*].[PublicIpAddress]' --output text)

echo "your public ip is $ip"

while :

do


curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer 6ejftz4q5f8n5baft3wzz6h1dh' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "uftzbofxe7ngzytsf7z9599cgw"
}' &

curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer t87k59wt9ifzmn9gpozbqesw3r' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "uftzbofxe7ngzytsf7z9599cgw"
}' &




curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer tn7b5nhkfpdy5j3fofxuawds1h' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "6daa68bxqt8cmqscsqics9dd8w"
}' &


curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer xofd9g6jt3bsugymqtisgypyoo' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "6daa68bxqt8cmqscsqics9dd8w"
}' &


curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer e8j97yc76j8tmn89ct414968fa' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "6daa68bxqt8cmqscsqics9dd8w"
}' &

curl --location --request POST "http://$ip/api/v4/posts" \
--header 'Authorization: Bearer 13fmb8dx93n77xzkajhnmj1zwo' \
--header 'Content-Type: application/json' \
--data-raw '{
    "message": "Whether you are working with Web, Java, PHP, C/C++, or a combination of those, the developer journey is fairly similar: you start out thinking you know how things work, and after a few iterations, you realize you have a lot to learn. ",
    "channel_id": "6daa68bxqt8cmqscsqics9dd8w"
}' &


sleep 1

done
