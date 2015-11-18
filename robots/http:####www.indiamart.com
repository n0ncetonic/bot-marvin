{"entries":[{"userAgents":["Mediapartners-Google"],"rules":[{"path":"%2Fcgi%2F","allowance":true},{"path":"%2F","allowance":true}]},{"userAgents":["Adsbot-Google"],"rules":[{"path":"%2Fcgi%2F","allowance":true},{"path":"%2F","allowance":true}]}],"sitemaps":[],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fstats%2F","allowance":false},{"path":"%2Fcgi%2F","allowance":false},{"path":"%2Ftemp%2F","allowance":false},{"path":"%2Fcompany1%2F","allowance":false},{"path":"%2Fmdc%2F","allowance":false},{"path":"%2Fcompany%2FA%2F","allowance":false},{"path":"%2Fcompany%2FB%2F","allowance":false},{"path":"%2Fcompany%2FC%2F","allowance":false},{"path":"%2Fcompany%2FD%2F","allowance":false},{"path":"%2Fcompany%2FN%2F","allowance":false},{"path":"%2Fcompany%2FG0%2F","allowance":false},{"path":"%2Fcompany%2FG2%2F","allowance":false},{"path":"%2Fcompany%2Fpurl%2F","allowance":false},{"path":"%2Fcompany%2Fview-catalog.html","allowance":false},{"path":"%2Feasybuy%2Fcmp%2F","allowance":false},{"path":"%2Feyeblaster%2F","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.indiamart.com/robots.txt","chunks":["User-agent: *\nDisallow: /stats/  # stats directory\nDisallow: /cgi/\nDisallow: /temp/\nDisallow: /company1/\nDisallow: /mdc/\nDisallow: /company/A/\nDisallow: /company/B/\nDisallow: /company/C/\nDisallow: /company/D/\nDisallow: /company/N/\nDisallow: /company/G0/\nDisallow: /company/G2/\nDisallow: /company/purl/\nDisallow: /company/view-catalog.html\nDisallow: /easybuy/cmp/\nDisallow: /eyeblaster/  # Disallow eyeblaster to avoid indexing of eyeblaster page\nUser-agent: Mediapartners-Google\nAllow: /cgi/\nAllow: /\nUser-agent: Adsbot-Google\nAllow: /cgi/\nAllow: /\n",null]}