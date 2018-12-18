sed -i -e "s/^shiny.*//g" /etc/passwd
echo "shiny:x:$(id -u):$(id -g)::/tmp:/bin/bash" >> /etc/passwd
