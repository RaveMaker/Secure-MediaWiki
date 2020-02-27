#! /bin/bash

# This script secure all MediaWiki folders and files permissions

# This is the folder where all your MediaWiki installations are:
www="/www/"
# Loop all folder inside $www and try to locate WordPress installs.
for d in "$www"/*/; do
  # remove trail / from "$d" (/www/website instead of /www/website/)
  d=${d%/}
  if [ -f "$d"/LocalSettings.php ]; then
    # MediaWiki Found at $d
    echo "MediaWiki found! $d"
    chmod 644 "$d"/LocalSettings.php
    chown root:root "$d" -R
    find "$d" -type d -exec chmod 755 {} \;
    find "$d" -type f -exec chmod 644 {} \;
    chown root:apache "$d"/LocalSettings.php
    chmod 640 "$d"/LocalSettings.php
    find "$d"/cache -type d -exec chmod 777 {} \;
    find "$d"/cache -type f -exec chmod 666 {} \;
    find "$d"/images -type d -exec chmod 777 {} \;
    find "$d"/images -type f -exec chmod 666 {} \;
    find "$d"/skins -type d -exec chmod 777 {} \;
    find "$d"/skins -type f -exec chmod 666 {} \;
    find "$d"/tmp -type d -exec chmod 777 {} \;
    find "$d"/tmp -type f -exec chmod 666 {} \;
    find "$d"/extensions/Widgets/compiled_templates -type d -exec chmod 777 {} \;
    find "$d"/extensions/Widgets/compiled_templates -type f -exec chmod 666 {} \;
    chcon -R -t httpd_sys_content_t "$d"
    chcon -R -t httpd_sys_script_exec_t "$d"/includes/GlobalFunctions.php
    chcon -R -t httpd_sys_rw_content_t "$d"/cache
    chcon -R -t httpd_sys_rw_content_t "$d"/images
    chcon -R -t httpd_sys_rw_content_t "$d"/skins
    chcon -R -t httpd_sys_rw_content_t "$d"/tmp
    chcon -R -t httpd_sys_rw_content_t "$d"/extensions/Widgets/compiled_templates
  fi
done
