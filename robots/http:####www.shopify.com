{"entries":[],"sitemaps":["https://www.shopify.com/sitemap.xml","https://www.shopify.com/sitemap_blog.xml"],"defaultEntry":"","disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"https://www.shopify.com/robots.txt","chunks":["# robots.txt file for www.shopify.com\n\nUser-agent: *\n\nSitemap: https://www.shopify.com/sitemap.xml\nSitemap: https://www.shopify.com/sitemap_blog.xml\n\nDisallow: /blog/tagged/*page*\nDisallow: /blog/topics/*page*\nDisallow: /technology/tagged/*page*\nDisallow: /landing\nDisallow: /blogsearch\nDisallow: /ventureone\n\n",null]}