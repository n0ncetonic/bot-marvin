var request = require("request");
var urllib = require('url');
var regex_urlfilter=require("./regex-urlfilter.js").load();
var config=require("./config/config").load();
var queued=0;
var active_sockets=0;
var bot={
	"queued":0,
	"active_sockets":0,
	"batch":{},
	"batchSize":0,
	"links":[],
	"botObjs":{},
	"getTask":function(fn){
		process.on('message',function(data){
			//recieving instructions from parent
			var k=data["init"];
			if(k){
				bot.batch=k[0];
				bot.batchSize=k[1];
				bot.links=k[2];
				bot.botObjs=k[3];
				//prepare regexes
				
				fn(bot.batch);
			}
		});
	},
	"setRegexes":function(){
		regex_urlfilter.setExternalLinksRegex(bot.links);
	},
	"queueLinks":function(pools){
		bot.queued=0;
		for (var i = 0; i < pools.length; i++) {
			if(pools!==null && pools[i]!==undefined){
				var url=pools[i]['_id'];
				var domain=pools[i]['domain'];
				(function(url,domain){
					setTimeout(function(){ bot.processLink(url,domain); }, 100); //to avoid recursion
				})(url,domain);
				
			}
			else{
				break;
			}

		};

	},
	"processLink":function(url,domain){
		var bot=this;//inside setTimeout no global access
		if(bot.active_sockets>config["max_concurrent_sockets"]){
			//pooling to avoid socket hanging
			(function(url,domain){
					setTimeout(function(){ bot.processLink(url,domain); }, 1000); //to avoid recursion
			})(url,domain);
			return;
		}

		
		if(bot.botObjs!==null){
			//if robots is enabled
			//check if access is given to the crawler for requested resource
			var bot=botObjs[domain];
			if(!(typeof(bot)==="string" && bot==="NO_ROBOTS")){
				 parser.canFetch('*',url, function (access) {
				      if (!access) {
				        // access not given exit 
							process.send({"setCrawled":[url,{},"Robots"]});
							bot.isLinksFetched();
							return;
					    }
					    else{
					    	bot.fetch(url,domain);//constraints are met let's fetch the page
					    }
				  });
			
			}
			else{
				//no robots file for asked domain
				bot.fetch(url,domain);//constraints are met let's fetch the page
			}
			
		}
		else{
			bot.fetch(url,domain);//constraints are met let's fetch the page
		}

	},
	"fetch":function(url,domain){
		var req_url=url;
		if(bot.links[domain]["phantomjs"]){
			//new url if phantomjs is being used
			req_url=config["phantomjs_url"]+req_url;
		}
		bot.active_sockets+=1;
		request({uri:req_url,pool:{maxSockets: Infinity}},function(err,res,html){
			bot.active_sockets-=1;
			if(html===undefined){
				//some error with the request return silently
				console.log("[ERROR] Max sockets reached read docs/maxSockets.txt");
				process.send({"setCrawled":[url,{},"Failed"]});
				bot.isLinksFetched();
				return;
			}
					var parser=require("./parsers/"+bot.links[domain]["parseFile"]);
					var dic=parser.init.parse(html,url);//pluggable parser
					//dic[0] is cheerio object
					//dic[1] is dic to be inserted
					//dic[2] inlinks suggested by custom parser
					bot.grabInlinks(dic[0],url,domain,dic[2]);
					process.send({"setCrawled":[url,dic[1]]});
					bot.isLinksFetched();
					
					
				});
	},
	"grabInlinks":function($,url,domain,linksFromParsers){
		for (var i = 0; i < linksFromParsers.length; i++) {
			var q=linksFromParsers[i];
			process.send({"addToPool":[q,config["counter_domain"]]});
		};
			var a=$("a").each(function(){
				function reject(a){
					//console.log(a+"rule");
					//console.log("[INFO] domain "+domain);
					//console.log("[INFO] abs "+abs);
					//console.log("[INFO] "+href+" rejected by filters");
					return true;
					
				}
				var href=$(this).attr("href");
				if(href!==undefined){
					
					//console.log("[INFO] url "+href);
					var abs=urllib.resolve(domain,href);
					
					if(abs.match(regex_urlfilter.accept)===null){ //user give acceptance
						if(abs.match(regex_urlfilter.getExternalLinksRegex)===null){
							return reject("1");
						}
					}
					
					for (var i = 0; i < regex_urlfilter.reject.length; i++) {
						if(abs.match(regex_urlfilter.reject[i])!==null){
								return reject("2");

						}
						
					};
					
					process.send({"addToPool":[abs,domain]});
				}

			});
			//console.log("[INFO] Got "+a.length+" links from "+url)
	},
	"isLinksFetched":function(){
				bot.queued+=1;
				if(bot.queued===bot.batch.length){
					process.exit(0);//exit 
				}

	}


};


bot.getTask(function(links){

	bot.queueLinks(links);

});

