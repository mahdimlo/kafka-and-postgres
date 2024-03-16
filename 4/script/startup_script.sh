#!/bin/bash

apt update

apt install -y cron libpq-dev systemctl python3 python3-pip

pip3 install -r /code/requirement.txt

schedule="* * * * *"
python="/usr/bin/python3"
log_file_get_data="/code/get_data.log"
log_file_consumer_1="/code/consumer_1.log"
log_file_consumer_2="/code/consumer_2.log"
log_file_consumer_3="/code/consumer_3.log"

(crontab -l; echo "$schedule $python /code/get_data.py >> $log_file_get_data 2>&1") | crontab -
(crontab -l; echo "$schedule $python /code/consumer_1.py >> $log_file_consumer_1 2>&1") | crontab -
(crontab -l; echo "$schedule $python /code/consumer_2.py >> $log_file_consumer_2 2>&1") | crontab -
(crontab -l; echo "$schedule $python /code/consumer_3.py >> $log_file_consumer_3 2>&1") | crontab -

systemctl restart cron

echo "Cron jobs added successfully."
