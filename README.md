Secure-MediaWiki
================

Fix permissions for all MediaWiki instances installed in a specific folder.

Also supports SELinux Enforcing.

### Installation

1. Clone this script from github or copy the files manually to your preferred directory.

2. Edit script and point 'www' param to the folder containing your MediaWiki folder.

- for example if MediaWiki is located in /var/www/html/mediawiki:

```
/var/www/html
```

> LocalSettings.php is set to root:apache with 640 permissions. 

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net
 
