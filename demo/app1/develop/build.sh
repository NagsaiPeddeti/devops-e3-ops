VERSION=`jq -r .version code/package.json`
echo $VERSION

docker build -t localhost:5000/$1/$2/$3:$VERSION .

docker push localhost:5000/$1/$2/$3:$VERSION

docker rmi localhost:5000/$1/$2/$3:$VERSION