{"entries":[{"userAgents":["Mediapartners-Google"],"rules":[{"path":"%2Frestaurants%2Fsearch*","allowance":false}]},{"userAgents":["AdsBot-Google"],"rules":[{"path":"%2Frestaurants%2Fsearch*","allowance":false}]},{"userAgents":["adidxbot"],"rules":[{"path":"%2Frestaurants%2Fsearch*","allowance":false}]}],"sitemaps":["http://spiderbites.nytimes.com/sitemaps/www.nytimes.com/sitemap.xml.gz","http://www.nytimes.com/sitemaps/sitemap_news/sitemap.xml.gz","http://spiderbites.nytimes.com/sitemaps/sitemap_video/sitemap.xml.gz"],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fads%2Fpublic%2F","allowance":true},{"path":"%2Fsvc%2Fnews%2Fv3%2Fall%2Fpshb.rss","allowance":true},{"path":"%2Fads%2F","allowance":false},{"path":"%2Fadx%2Fbin%2F","allowance":false},{"path":"%2Farchives%2F","allowance":false},{"path":"%2Fauth%2F","allowance":false},{"path":"%2Fcnet%2F","allowance":false},{"path":"%2Fcollege%2F","allowance":false},{"path":"%2Fexternal%2F","allowance":false},{"path":"%2Ffinancialtimes%2F","allowance":false},{"path":"%2Fidg%2F","allowance":false},{"path":"%2Findexes%2F","allowance":false},{"path":"%2Flibrary%2F","allowance":false},{"path":"%2Fnytimes-partners%2F","allowance":false},{"path":"%2Fpackages%2Fflash%2Fmultimedia%2FTEMPLATES%2F","allowance":false},{"path":"%2Fpages%2Fcollege%2F","allowance":false},{"path":"%2Fpaidcontent%2F","allowance":false},{"path":"%2Fpartners%2F","allowance":false},{"path":"%2Frestaurants%2Fsearch*","allowance":false},{"path":"%2Freuters%2F","allowance":false},{"path":"%2Fregister","allowance":false},{"path":"%2Fthestreet%2F","allowance":false},{"path":"%2Fsvc","allowance":false},{"path":"%2Fvideo%2Fembedded%2F*","allowance":false},{"path":"%2Fweb-services%2F","allowance":false},{"path":"%2Fgst%2Ftravel%2Ftravsearch*","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.nytimes.com/robots.txt","chunks":["User-agent: *\nAllow: /ads/public/\nAllow: /svc/news/v3/all/pshb.rss\nDisallow: /ads/\nDisallow: /adx/bin/\nDisallow: /archives/\nDisallow: /auth/\nDisallow: /cnet/\nDisallow: /college/\nDisallow: /external/\nDisallow: /financialtimes/\nDisallow: /idg/\nDisallow: /indexes/\nDisallow: /library/\nDisallow: /nytimes-partners/\nDisallow: /packages/flash/multimedia/TEMPLATES/\nDisallow: /pages/college/\nDisallow: /paidcontent/\nDisallow: /partners/\nDisallow: /restaurants/search*\nDisallow: /reuters/\nDisallow: /register\nDisallow: /thestreet/\nDisallow: /svc\nDisallow: /video/embedded/*\nDisallow: /web-services/\nDisallow: /gst/travel/travsearch*\n\nUser-agent: Mediapartners-Google\nDisallow: /restaurants/search*\n\nUser-agent: AdsBot-Google\nDisallow: /restaurants/search*\n\nUser-agent: adidxbot\nDisallow: /restaurants/search*\n\nSitemap: http://spiderbites.nytimes.com/sitemaps/www.nytimes.com/sitemap.xml.gz\nSitemap: http://www.nytimes.com/sitemaps/sitemap_news/sitemap.xml.gz\nSitemap: http://spiderbites.nytimes.com/sitemaps/sitemap_video/sitemap.xml.gz\n",null]}