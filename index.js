//sys argv
var argv = require('minimist')(process.argv.slice(2));
var config=require("./config/config").load();
var regex_urlfilter=require("./regex-urlfilter.js").load();
var db_type=config["db_type"];
var help=argv["help"];
if(help){
	require('./docs/help');
}
var collection;
var childs=parseInt(config["childs"]);//childs to spawn
var batchSize=parseInt(config["batch_size"]);
var active_childs=0;

//requires
var tracker=require("./server");
var child=require('child_process');
var pool=require('./pool');

function starter(){
	console.log("[INFO] Check if new child available");
	console.log(active_childs);
	for (var i = active_childs; i < childs; i++) {
		  pool.getNextBatch(function(err,results){
				if(results.length!==0){
					createChild(results);
				}
				else{
					console.log(inlinks_pool.length+" len");
					//push pool into db as childs are available but no buckets
					var k=inlinks_pool.splice(0,batchSize);
					pool.addToPool(k);
				}
					
					
				},batchSize);
		}
}


pool=pool.getDB(db_type).init();//choosing db type
var inlinks_pool=[];
var seed_links=pool.readSeedFile();//read the seed file
function createChild(results){
	active_childs+=1;
	var bot = child.fork("spawn.js",[]);	
	console.log('[INFO] Child process started ');
	var args=[results,batchSize,pool.links,botObjs];
	bot.send({"init":args});
	bot.on('close', function (code) {
				//pushing the pool to db
				var k=inlinks_pool.splice(0,batchSize);
				pool.addToPool(k);
		
	

	  console.log('[INFO] Child process exited with code ' + code);
	  active_childs-=1;
	  for (var i = active_childs; i < childs; i++) {
		  pool.getNextBatch(function(err,results){
				if(results.length!==0){
					createChild(results);
				}
					
					
				},batchSize);
		}
							
	  
	});

	bot.on("message",function(data){
		var t=data["setCrawled"];
		var d=data["addToPool"];
		if(t){
			pool.setCrawled(t[0],t[1]);
		}
		else if(d){
			inlinks_pool.push(d);
			if(inlinks_pool.length>batchSize){
				var k=inlinks_pool.splice(0,batchSize);
				pool.addToPool(k);
				
				

			}

		
		}

	});

}



function initConnection(){
	pool.createConnection(function(){
		pool.seed(seed_links,function(){
			for (var i = 0; i < childs; i++) {
				pool.getNextBatch(function(err,results){
					if(results.length!==0){
						createChild(results);
					}
					
					
									
				},batchSize);
			}

		});

	});

}
var botObjs;
if(config["allow_robots"]){
	console.log("[INFO] downloading robots.txt this could take a while");
	var robots=require('./robots.js').app;
	botObjs=robots.bots;
	robots.init(Object.keys(pool.links),function(){
		console.log("[INFO] robots.txt parsed");
		initConnection();
		setInterval(starter,5000);
	});
}
else{
	initConnection();
	setInterval(starter,5000);
}


tracker.init(pool);//starting crawler webapp



