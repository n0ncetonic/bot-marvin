{"entries":[{"userAgents":["Fasterfox"],"rules":[{"path":"%2F","allowance":false}]}],"sitemaps":[],"defaultEntry":{"userAgents":["*"],"rules":[{"path":"%2Fajax.php","allowance":false},{"path":"%2Fcalendar.php","allowance":false},{"path":"%2Fcron.php","allowance":false},{"path":"%2Feditpost.php","allowance":false},{"path":"%2Fglobal.php","allowance":false},{"path":"%2Fimage.php","allowance":false},{"path":"%2Finlinemod.php","allowance":false},{"path":"%2Fjoinrequests.php","allowance":false},{"path":"%2Flogin.php","allowance":false},{"path":"%2Fmemberlist.php","allowance":false},{"path":"%2Fmisc.php","allowance":false},{"path":"%2Fmoderator.php","allowance":false},{"path":"%2Fnewattachment.php","allowance":false},{"path":"%2Fnewreply.php","allowance":false},{"path":"%2Fnewthread.php","allowance":false},{"path":"%2Fonline.php","allowance":false},{"path":"%2Fpostings.php","allowance":false},{"path":"%2Fprintthread.php","allowance":false},{"path":"%2Fprivate.php","allowance":false},{"path":"%2Fprofile.php","allowance":false},{"path":"%2Fregister.php","allowance":false},{"path":"%2Freport.php","allowance":false},{"path":"%2Freputation.php","allowance":false},{"path":"%2Fsearch.php","allowance":false},{"path":"%2Fsendmessage.php","allowance":false},{"path":"%2Fsubscription.php","allowance":false},{"path":"%2Fthreadrate.php","allowance":false},{"path":"%2Fusercp.php","allowance":false},{"path":"%2Fwho.php","allowance":false},{"path":"%2Fcountries.php","allowance":false}]},"disallowAll":false,"statusCode":200,"allowAll":false,"options":{"headers":{"userAgent":"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0"}},"url":"http://www.xossip.com/robots.txt","chunks":["User-agent: *\r\nDisallow: /ajax.php\r\nDisallow: /calendar.php\r\nDisallow: /cron.php\r\nDisallow: /editpost.php\r\nDisallow: /global.php\r\nDisallow: /image.php\r\nDisallow: /inlinemod.php\r\nDisallow: /joinrequests.php\r\nDisallow: /login.php\r\nDisallow: /memberlist.php\r\nDisallow: /misc.php\r\nDisallow: /moderator.php\r\nDisallow: /newattachment.php\r\nDisallow: /newreply.php\r\nDisallow: /newthread.php\r\nDisallow: /online.php\r\nDisallow: /postings.php\r\nDisallow: /printthread.php\r\nDisallow: /private.php\r\nDisallow: /profile.php\r\nDisallow: /register.php\r\nDisallow: /report.php\r\nDisallow: /reputation.php\r\nDisallow: /search.php\r\nDisallow: /sendmessage.php\r\nDisallow: /subscription.php\r\nDisallow: /threadrate.php\r\nDisallow: /usercp.php\r\nDisallow: /who.php\r\nDisallow: /countries.php\r\n\r\nUser-agent: Fasterfox\r\nDisallow: /\r\n",null]}