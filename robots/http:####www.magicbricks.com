{"entries":[{"userAgents":["Wotbox/2.01 (+http://www.wotbox.com/bot/)"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["BOT/0.1"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["FreeWebMonitoring SiteChecker/0.2"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["IstellaBot/1.10.2"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["oBot/2.3.1"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["SEOkicks-Robot"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["YoudaoBot/1.0"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["SeznamBot/3.0"],"rules":[{"path":"%2F","allowance":false}]},{"userAgents":["yacybot"],"rules":[{"path":"%2F","allowance":false}]}],"sitemaps":["http://www.magicbricks.com/sitemap_index.xml"],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fgreybox%2F","allowance":false},{"path":"%2Fcropper%2F","allowance":false},{"path":"%2Ftrapscript%2F","allowance":false},{"path":"%2Fmaintenance%2F","allowance":false},{"path":"%2Fadmin%2F","allowance":false},{"path":"%2Fbricks%2Fdwr%2F","allowance":false},{"path":"%2Fprofile%2F","allowance":false},{"path":"%2Fimages%2F","allowance":false},{"path":"%2Fproperty%2Fcity_content%2F","allowance":false},{"path":"%2Fproperty%2Fimages_magicbricks%2F","allowance":false},{"path":"%2Fproperty%2Fmagic_js%2F","allowance":false},{"path":"%2Fproperty%2Fmaintenance%2F","allowance":false},{"path":"%2Fproperty%2Fmicrosite%2Fform%2F","allowance":false},{"path":"%2Fproperty%2Fprop-shosh%2F","allowance":false},{"path":"%2Fproperty%2Ftest%2F","allowance":false},{"path":"%2FpropertyDetails%2Fmap-of-","allowance":false},{"path":"%2FReal-estate-projects-Search%2Fresidential-new-project%3Fproptype%3D","allowance":false},{"path":"%2FReal-estate-property-agents%2Fagent-in-Noida%3Fproptype%3D","allowance":false},{"path":"%2Fproperty-for-sale%2Fcommercial-real-estate%3Fproptype%3D","allowance":false},{"path":"%2Fproperty-for-sale%2Fresidential-real-estate%3Fproptype%3D","allowance":false},{"path":"%2FReal-Estate-Forum%2Fmember-profile","allowance":false},{"path":"%2Fproperty-for-sale%2FALL-RESIDENTIAL-by-","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.magicbricks.com/robots.txt","chunks":["User-agent: Wotbox/2.01 (+http://www.wotbox.com/bot/)\r\nDisallow: /\r\nUser-agent: BOT/0.1\r\nDisallow: /\r\nUser-agent: FreeWebMonitoring SiteChecker/0.2\r\nDisallow: /\r\nUser-agent: IstellaBot/1.10.2\r\nDisallow: /\r\nUser-agent: oBot/2.3.1\r\nDisallow: /\r\nUser-agent: SEOkicks-Robot\r\nDisallow: /\r\nUser-agent: YoudaoBot/1.0\r\nDisallow: /\r\nUser-agent: SeznamBot/3.0\r\nDisallow: /\r\nUser-agent: yacybot\r\nDisallow: /\r\nUser-agent: *\r\nDisallow: /greybox/\r\nDisallow: /cropper/\r\nDisallow: /trapscript/\r\nDisallow: /maintenance/\r\nDisallow: /admin/\r\nDisallow: /bricks/dwr/\r\nDisallow: /profile/\r\nDisallow: /images/\r\nDisallow: /property/city_content/\r\nDisallow: /property/images_magicbricks/\r\nDisallow: /property/magic_js/\r\nDisallow: /property/maintenance/\r\nDisallow: /property/microsite/form/\r\nDisallow: /property/prop-shosh/\r\nDisallow: /property/test/\r\nDisallow: /propertyDetails/map-of-\r\nDisallow: /Real-estate-projects-Search/residential-new-project?proptype=\r\nDisallow: /Real-estate-property-agents/agent-in-Noida?proptype=\r\nDisallow: /property-for-sale/commercial-real-estate?proptype=\r\nDisallow: /property-for-sale/residential-real-estate?proptype=\r\nDisallow: /Real-Estate-Forum/member-profile              \r\nDisallow: /property-for-sale/ALL-RESIDENTIAL-by-   \r\n\r\nSitemap: http://www.magicbricks.com/sitemap_index.xml\r\n\r\n",null]}