query='{}'
FIELDFILE="bin/panel-fields.txt"
COLLECTION='panels'
DUMPFILE="public/data/dump.csv"

# mongoexport --query "$query" \
# --host ${host[0]} --db ${db} --username ${username} --password ${password} -o ${outfile} --csv \
# --collection ${collection} \
# --fieldFile $fieldFile

mongoexport --host localhost:3001 --db meteor \
	--collection $COLLECTION \
	--fieldFile $FIELDFILE \
	--csv > $DUMPFILE
