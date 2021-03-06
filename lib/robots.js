var parent_dir = process.getAbsolutePath(__dirname);
var request = require("request");
var fs = require('fs');
var check = require("check-types");
var robots = require('robots');

/**
	Represents Robots.txt parser
	@author Tilak Patidar <tilakpatidar@gmail.com>
	@constructor
	@param {Message} message_obj

*/

var Robots = function Robots(message_obj, parallel_requests) {


    var message = message_obj;
    var log = message.get('log');
    var pool = message.get('pool');
    var urls = message.get('robots_links');
    var that = this;
    var requests = parallel_requests;
    var requests_made = 0;
    var called = false;
    /**
    	Parses robots.txt for loaded urls.
    	@public
    	@param {Function} fn - callback

    */
    this.parse = function(fn) {

        try {
            msg("Preparing robots.txt files this will take time . . .", "info");
            var err;
            loadCache(function init_loadCache() {


                function robots_iterator() {
                    if (called) {
                        return;
                    }
                    msg("requests_made  " + requests_made + "    requests" + requests, "info");
                    var req_url = urls.splice(0, 1)[0];
                    //console.log(req_url);


                    if (!check.assigned(req_url)) {
                        --requests_made;
                        if (urls.length === 0 && !called) {
                            called = true;
                            return fn(err, that.bots);
                        }
                        return;
                    }

                    if (check.assigned(that.bots[req_url])) {
                        --requests_made;
                        if (urls.length === 0 && !called) {
                            called = true;
                            return fn(err, that.bots);
                        }
                        for (var i = requests_made; i < requests; i++) {
                            ++requests_made;
                            process.nextTick(robots_iterator);
                        }
                        return;

                    }




                    var parser = new robots.RobotsParser();
                    var req_url_new = req_url.split("/").slice(0, 3).join("/");
                    var init_time = new Date().getTime();
                    if (!check.assigned(that.bots[req_url])) {

                        parser.setUrl(req_url_new + '/robots.txt', function parser_setUrl(parser_obj, success) {

                            if (success) {
                                msg(("Robots.txt parsed for " + req_url), "success");
                                addToCache(req_url_new, parser_obj, function() {

                                });
                                that.bots[req_url] = parser_obj; //saving robots obj
                            } else {
                                msg(("No Robots.txt found for " + req_url), "error");
                                var parser_obj = {
                                    "NO_ROBOTS": true
                                };
                                addToCache(req_url_new, parser_obj, function() {

                                });
                                that.bots[req_url] = parser_obj; //saving robots obj

                            }

                            --requests_made;

                            if (urls.length === 0 && !called) {
                                called = true;
                                return fn(err, that.bots);
                            }

                            for (var i = requests_made; i < requests; i++) {
                                ++requests_made;
                                process.nextTick(robots_iterator);
                            }

                            return;

                        });
                    } else {

                        --requests_made;
                        if (urls.length === 0 && !called) {
                            called = true;
                            return fn(err, that.bots);
                        }
                        for (var i = requests_made; i < requests; i++) {
                            ++requests_made;
                            process.nextTick(robots_iterator);
                        }
                        return;
                    }





                };

                ++requests_made;
                process.nextTick(robots_iterator);



            });

        } catch (err) {
            //console.log(err)
            return fn(err, null);
        }

    };

    /**
    	Loades already parsed robots.txt from mongodb store.
    	@private
    	@param {Function} fn - callback
    */
    var loadCache = function loadCache(fn) {

        pool.robots_collection.find({}).toArray(function loadCacheFn(err, docs) {
            //console.log(err,docs)
            if (!check.assigned(docs) || check.emptyArray(docs) || check.assigned(err)) {
                msg("Robots.txt cache is empty.", "info");
                return fn();
            } else {
                for (var i = docs.length - 1; i >= 0; i--) {
                    var data = docs[i]["robot"];
                    var domain = docs[i]["_id"];
                    if (check.assigned(data)) {
                        that.bots[domain] = data;
                        msg(("Robots.txt loaded from cache for " + domain), "success");
                    }
                    if (i === 0) {
                        return fn();
                    }
                };

            }
        });

    };

    /**
    	Parsed data is stored in this JSON object.
    	@public
    */
    this.bots = {};

    /**
    	Adds parsed data for a url into mongodb.
    	@private
    	@param {String} key - url
    	@param {String} value - parsed data from robots.txt

    */
    function addToCache(key, value, fn) {
        pool.robots_collection.insert({
            "_id": key,
            "robot": value
        }, function addToCache(err) {
            return fn();
        });
    };

    function msg() {
        log.put(arguments[0], arguments[1], __filename.split('/').pop(), arguments.callee.caller.name.toString());
    }
};

module.exports = Robots;