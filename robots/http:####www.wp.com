{"entries":[{"userAgents":["IRLbot"],"rules":[],"crawl_delay":"3600"}],"sitemaps":["https://wordpress.com/sitemap.xml"],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fnext%2F","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"https://wordpress.com/robots.txt","chunks":["# This file was generated on Wed, 18 Nov 2015 11:06:21 +0000\n# If you are regularly crawling WordPress.com sites, please use our firehose to receive real-time push updates instead.\n# Please see http://en.wordpress.com/firehose/ for more details.\n\nSitemap: https://wordpress.com/sitemap.xml\nUser-agent: IRLbot\nCrawl-delay: 3600\n\nUser-agent: *\nDisallow: /next/\n\nUser-agent: *\nDisallow: /mshots/v1/\n\n# har har\nUser-agent: *\nDisallow: /activate/\n\nUser-agent: *\nDisallow: /public.api/\n\n# MT refugees\nUser-agent: *\nDisallow: /cgi-bin/\n\nUser-agent: *\nDisallow: /wp-admin/\n",null]}