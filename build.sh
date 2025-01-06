# we need both the environment, and the product to discriminate
if [ "$#" -lt 1 ]; then
	echo "this project requires target environment"
	make error
elif [ "$1" = "prod" ] || [ "$1" = "master" ]; then
	make prod
else
	make dev
fi