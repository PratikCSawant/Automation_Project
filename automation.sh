s3bucketName=upgrad-pratiksawant

userName=pratik

sudo apt update -y

sudo apt install apache2

sudo systemctl status apache2

timeStamp=$(date "+%d%m%Y-%H%M%S")

sudo tar cvf /tmp/${userName}-httpd-logs-${timeStamp}.tar /var/log/apache2

aws s3 cp /tmp/${userName}-httpd-logs-${timeStamp}.tar s3://${s3bucketName}/${userName}-httpd-logs-${timeStamp}.tar

echo "httpd-logs $(date "+%d%m%Y-%H%M%S") tar     $(stat -c '%s' automation.sh | numfmt --to=si)K"  >> /var/www/html/inventory.html
