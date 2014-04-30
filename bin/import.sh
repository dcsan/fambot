mongoimport --host localhost:3001 --db meteor --collection chatter \
	--type csv --drop --headerline --file data/chatter.csv