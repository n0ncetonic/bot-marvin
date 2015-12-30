/*
	stats.js
	Used for cluster stats for the web app.
*/
var pool;
var proto=require(__dirname+'/lib/proto.js');
JSONX=proto["JSONX"];//JSON for regex support in .json files
process.getAbsolutePath=proto.getAbsolutePath;
var log=require(__dirname+"/lib/logger.js");
var config=require(__dirname+"/lib/config-reloader.js");
var cluster;
var app={
	"clusterInfo":function(fn){
		var id_name=config.getConfig('cluster_name');
		pool.stats.cluster_info(id_name,function(err,results){
			fn(err,results);
			return;
		});
	},
	"activeBots":function(fn){
		var d={};
		d['db_type']=config.getConfig('db_type');
		d['db']=config.getConfig(config.getConfig('db_type'));
		pool.stats.activeBots(function(err,docs){
			fn([docs,d]);
			return;
		});
	},
	"crawlStats":function(fn){
		pool.stats.crawlStats(function(dic){
			fn(dic);
		});
		

	},
	"readLog":function(bot_name,type,lines,fn){
		cluster.send(bot_name,{"readLog":{"type":type,"n":lines}},function(status,response){
				fn(status,response);
			});
	},
	"getConfig":function(bot_name,fn){
			pool.cluster.getBotConfig(bot_name,function(err,results){
			try{

				fn(err,results.config);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"getCrawledPages":function(bot_name,i,len,sort_key,sort_type,fn){
			if(bot_name==="master"){
				var d={done:true,"response":{$eq:200}};
			}
			else {
				var d={"updatedBy":bot_name,done:true,"response":{$eq:200}};
			}
			var sor={};
			if(sort_key===undefined){
				sor['lastModified']=-1;
			}
			else{
				sor[sort_key]=sort_type;
			}
			pool.stats.getCrawledPages(d,len,i,sor,function(err,results){
			try{

				fn(err,results);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"getFailedPages":function(bot_name,i,len,sort_key,sort_type,fn){
			if(bot_name==="master"){
				var d={done:true,"response":{$ne:200}};
			}
			else {
				var d={"updatedBy":bot_name,done:true,"response":{$ne:200}}
			}
			var sor={};
			if(sort_key===undefined){
				sor['lastModified']=-1;
			}else{
				sor[sort_key]=sort_type;
			}
			pool.stats.getFailedPages(d,len,i,sor,function(err,results){
			try{

				fn(err,results);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"getTotalBuckets":function(bot_name,i,len,sort_key,sort_type,fn){
			if(bot_name==="master"){
				var d={};
			}
			else {
				var d={"insertedBy":bot_name}
			}
			var sor={};
			if(sort_key===undefined){
				sor['lastModified']=-1;
			}else{
				sor[sort_key]=sort_type;
			}
			pool.stats.getTotalBuckets(function(err,results){
			try{

				fn(err,results);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"getProcessedBuckets":function(bot_name,i,len,sort_key,sort_type,fn){
			if(bot_name==="master"){
				var d={"processingBot":{$exists:true}};
			}
			else {
				var d={"processingBot":bot_name}
			}
			var sor={};
			if(sort_key===undefined){
				sor['lastModified']=-1;
			}else{
				sor[sort_key]=sort_type;
			}
			pool.stats.getProcessedBuckets(function(err,results){
			try{

				fn(err,results);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"indexField":function(collection_name,index_name,fn){
			var d={};
			d[index_name]="text";
			pool[collection_name].createIndex(d,function(err,results){
			try{

				fn(err,results);
			}
			catch(err){

			fn(err,{});
			}
		});
	},
	"setConfig":function(bot_name,js,fn){
			//updates the config changes done from local machine to db
			console.log(bot_name);
			console.log(js);
		pool.stats.updateConfig(bot_name,js,function(err,results){
			fn(err,results);
		});
	}
};
module.exports=function(init,clstr){
	pool=init;
	cluster=clstr;
	return app;
};