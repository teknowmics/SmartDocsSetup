#!/bin/bash

echo "infraAdminUI $(grep versionInfo /var/www/smartdocs/infraAdminUI/js/config.js)"
echo "sysAdminUI   $(grep versionInfo /var/www/smartdocs/sysAdminUI/js/config.js)"
echo "userUI       $(grep versionInfo /var/www/smartdocs/userUI/js/config.js)"
echo "API          $(cat /var/lib/tomcat7/webapps/server/api-revno.txt)"
echo "UIHelp       $(grep versionInfo /var/www/smartdocs/UIHelp/js/config.js)"

