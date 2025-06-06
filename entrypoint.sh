#!/bin/sh

# Required fields
[ -z "$HOST_1" ] && echo "HOST_1 is required." && exit 1
[ -z "$USER_1" ] && echo "USER_1 is required." && exit 1
[ -z "$PASSWORD_1" ] && echo "PASSWORD_1 is required." && exit 1
[ -z "$HOST_2" ] && echo "HOST_2 is required." && exit 1
[ -z "$USER_2" ] && echo "USER_2 is required." && exit 1
[ -z "$PASSWORD_2" ] && echo "PASSWORD_2 is required." && exit 1

# Optional SSL
ssl1=""
ssl2=""

[ "$SSL_1" = "yes" ] && ssl1="--ssl1"
[ "$SSL_2" = "yes" ] && ssl2="--ssl2"

echo "Starting IMAP sync..."
imapsync --host1 "$HOST_1" --user1 "$USER_1" --password1 "$PASSWORD_1" $ssl1 \
         --host2 "$HOST_2" --user2 "$USER_2" --password2 "$PASSWORD_2" $ssl2
echo "IMAP sync finished."
