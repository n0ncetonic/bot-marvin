{"entries":[{"userAgents":["Mediapartners-Google"],"rules":[{"path":"%2F","allowance":true}]},{"userAgents":["Googlebot"],"rules":[{"path":"%2F","allowance":true}]},{"userAgents":["Adsbot-Google"],"rules":[{"path":"%2F","allowance":true}]},{"userAgents":["Googlebot-Mobile"],"rules":[{"path":"%2F","allowance":true}]},{"userAgents":["ia_archiver"],"rules":[{"path":"%2F","allowance":false}]}],"sitemaps":[],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2F","allowance":true}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.brainyquote.com/robots.txt","chunks":["User-agent: *\nAllow: /\n\nUser-agent: Mediapartners-Google\nAllow: /\n\nUser-agent: Googlebot\nAllow: /\n\nUser-agent: Adsbot-Google\nAllow: /\n\nUser-agent: Googlebot-Mobile\nAllow: /\n\nUser-agent: ia_archiver\nDisallow: /\n",null]}