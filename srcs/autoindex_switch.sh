if grep "autoindex on;" /etc/nginx/sites-available/nginx.conf > /dev/null
then 
echo "autoindex off"
sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/nginx.conf
else
echo "autoindex on"
sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/nginx.conf
fi
service nginx restart