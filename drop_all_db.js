// Warning! This script will drop all DBs in the MongoDB server

// Run:  mongo drop_all_db.js

var dbs = db.getMongo().getDBNames()
for(var i in dbs){
    db = db.getMongo().getDB( dbs[i] );
    print( "dropping db " + db.getName() );
    db.dropDatabase();
}
