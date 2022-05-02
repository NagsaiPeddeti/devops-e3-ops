VERSION=`jq -r .version code/package.json`
echo $VERSION

export IMAGE_NAME=localhost:5000/$1/$2/$3:$VERSION 
export CONFIG_NAME=demo_prod_app1_01052022.json

cat configs/production.json | docker config create ${CONFIG_NAME} -

docker stack deploy -c docker-compose.yml demo_prod