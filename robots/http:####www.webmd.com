{"entries":[],"sitemaps":[],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2F404","allowance":false},{"path":"%2F500","allowance":false},{"path":"%2Fsearch%2Fsearch_results%2F","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.webmd.com/robots.txt","chunks":["#   Robots.txt file WebMD\r\n#   Updated: Jan 2007\r\n\r\nUser-agent: *\r\nDisallow: /404\r\nDisallow: /500\r\nDisallow: /search/search_results/\r\n",null]}