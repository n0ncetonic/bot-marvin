{"entries":[{"userAgents":["Googlebot-Image"],"rules":[{"path":"","allowance":true},{"path":"%2F*","allowance":true}]},{"userAgents":["Mediapartners-Google*"],"rules":[{"path":"","allowance":true},{"path":"%2F*","allowance":true}]}],"sitemaps":[],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fcgi-bin","allowance":false},{"path":"%2Fwp-admin","allowance":false},{"path":"%2Fwp-includes","allowance":false},{"path":"%2Fwp-content%2Fcache","allowance":false},{"path":"%2Ftrackback","allowance":false},{"path":"%2Ffeed","allowance":false},{"path":"%2Fcomments","allowance":false},{"path":"%2Fcategory%2F*%2F*","allowance":false},{"path":"*%2Ftrackback","allowance":false},{"path":"*%2Ffeed","allowance":false},{"path":"*%2Fcomments","allowance":false},{"path":"%2Fwp-content%2Fuploads","allowance":true},{"path":"%2Fwp-includes%2Fjs","allowance":true},{"path":"%2Fwp-includes%2Fcss","allowance":true}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.xda-developers.com/robots.txt","chunks":["User-agent: *\nDisallow: /cgi-bin\nDisallow: /wp-admin\nDisallow: /wp-includes\nDisallow: /wp-content/cache\nDisallow: /trackback\nDisallow: /feed\nDisallow: /comments\nDisallow: /category/*/*\nDisallow: */trackback\nDisallow: */feed\nDisallow: */comments\n# Disallow: /*?*\n# Disallow: /*?\nAllow: /wp-content/uploads\nAllow: /wp-includes/js\nAllow: /wp-includes/css\n\n\n# Google Image\nUser-agent: Googlebot-Image\nDisallow:\nAllow: /*\n\n# Google AdSense\nUser-agent: Mediapartners-Google*\nDisallow:\nAllow: /*\n",null]}