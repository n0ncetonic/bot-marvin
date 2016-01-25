var parent_dir=process.getAbsolutePath(__dirname);
var proto=require(parent_dir+'/lib/proto.js');
var JSONX=proto.JSONX;
var config={
  "robot_agent": "*",
  "bot_name": "zaphod",
  "cluster_name": "hitchiker",
  "childs": 2,
  "verbose": true,
  "logging": true,
  "network_interface": "wlan0",
  "network_host": "192.168.102.39",
  "network_port": "2020",
  "cluster_port": 5555,
  "parse_sitemaps": false,
  "env": "/usr/local/bin/node",
  "text_editor": "nano",
  "mongodb": {
    "mongodb_uri": "mongodb://192.168.101.5/crawl",
    "mongodb_collection": "links",
    "bucket_collection": "bucket",
    "semaphore_collection": "queue",
    "bot_collection": "bots",
    "cluster_info_collection": "cluster_info",
    "parsers_collection": "parsers",
    "sitemap_collection": "sitemap_data"
  },
  "http": {
    "timeout": 10000,
    "max_content_length": 10485760,
    "follow_redirect": true,
    "max_sockets_per_host": 10,
    "max_concurrent_sockets": 10,
    "headers": {
      "User-Agent": "Mozilla/5.0"
    }
  },
  "log_buffer_lines": 100,
  "recrawl_intervals": {
    "always": 600000,
    "monthly": 2592000000,
    "daily": 86400000,
    "weekly": 604800000,
    "yearly": 31536000000
  },
  "default_recrawl_interval": "monthly",
  "override_recrawl_interval_of_sitesmap_file": false,
  "tika_host": "0.0.0.0",
  "tika_port": "9998",
  "tika": true,
  "tika_supported_files": "__REGEXP /\\.(ppt|doc|pdf|docx|pptx)$/gi",
  "tika_batch_size": 5,
  "tika_content_length": 104857600,
  "tika_timeout": 300000,
  "tika_max_sockets_per_host": 10,
  "phantomjs_port": 9000,
  "allow_robots": true,
  "external_links": false,
  "batch_size": 100,
  "db_type": "mongodb",
  "remove_tags": [
    "table",
    "style",
    "script",
    "noscript",
    "img",
    "form",
    "input",
    "iframe",
    "header",
    "footer",
    "button",
    "pre",
    "br",
    "code",
    "select",
    "option",
    "nav"
  ],
  "accept_regex": "__REGEXP /http(|s):\\/\\/archive\\.org\\/details\\/.+|http(|s):\\/\\/archive\\.org\\/details\\/texts\\?&sort=-downloads&page=.+/gi",
  "reject_regex": [
    "__REGEXP /^(file|ftp|mailto|javascript|javascrpt|skype|whatsapp|tel):/g",
    "__REGEXP /\\.(gif|jpg|png|ico|css|sit|eps|wmf|zip|ppt|doc|mpg|xls|gz|rpm|tgz|mov|exe|jpeg|bmp|js|swf|pdf)$/gi"
  ]
}

function load(){
return JSONX.parse(JSON.stringify(config));
}
exports.load=load;

