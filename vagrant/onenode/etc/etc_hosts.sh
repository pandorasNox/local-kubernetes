#!/bin/sh

# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts

# DEFAULT IP FOR HOSTNAME
IP="127.0.0.1"

# how to use:
# validate_ip 1.2.3.4
# IS_VALID_IP=$?
# 0 = valid
# 1 = invalid
validate_ip()
{
  IP_TO_BE_VALIDATED=$1
  if expr "$IP_TO_BE_VALIDATED" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
    return 0
  else
    return 1
  fi
}

validate_ip $1
IS_VALID_IP=$?
if [[ $IS_VALID_IP -eq 0 ]]; then
  echo "ip is valid"
  IP=$1
else
  echo "first argument has to be a valid IP"
  exit
fi

echo IP: $IP

# how to use:
# validate_hostname foo.bar
# IS_VALID_HOST=$?
# 0 = valid
# 1 = invalid
validate_hostname()
{
  ASSUMED_HOSTNAME=$1
  ValidHostnameRegex="^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9]))*$"
  if [[ $ASSUMED_HOSTNAME =~ $ValidHostnameRegex ]]; then
    # echo "success"
    return 0
  else
    # echo "fail"
    return 1
  fi
}

HOST_NAME="localhost"

validate_hostname $2
IS_VALID_HOST=$?
if [[ $IS_VALID_HOST -eq 0 ]]; then
  echo "host is valid"
  HOST_NAME=$2
else
  echo "2nd argument has to be a valid hostname"
  exit
fi

echo "hostname: " $HOST_NAME

function addhost() {
    ETC_HOST_IP=$1
    ETC_HOST_NAME=$2
    HOSTS_LINE="$ETC_HOST_IP\t$ETC_HOST_NAME"
    if [ -n "$(grep $ETC_HOST_NAME /etc/hosts)" ]
        then
            echo "$ETC_HOST_NAME already exists : $(grep $ETC_HOST_NAME $ETC_HOSTS)"
        else
            echo "Adding $ETC_HOST_NAME to your $ETC_HOSTS";
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

            if [ -n "$(grep $ETC_HOST_NAME /etc/hosts)" ]
                then
                    echo "$ETC_HOST_NAME was added succesfully \n $(grep $ETC_HOST_NAME /etc/hosts)";
                else
                    echo "Failed to Add $ETC_HOST_NAME, Try again!";
            fi
    fi
}

echo $(addhost $IP $HOST_NAME)
