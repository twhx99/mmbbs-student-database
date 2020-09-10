image_name=$(basename $(pwd)_snapshot)
echo "(Re-)Building Image $image_name"
docker image rm $image_name
docker build -t $image_name .
echo "Running Image $image_name"
docker run -d -p 3306:3306 $image_name

