if grep "autoindex on;" /etc/nginx/sites-available/nginx-block > /dev/null
then 
echo "autoindex off"
sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/nginx-block
else
echo "autoindex on"
sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/nginx-block
fi
service nginx restart