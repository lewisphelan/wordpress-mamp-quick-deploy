# WordPress MAMP Quick Deploy

Constantly making new local WordPress installations? Same here. Let's make it quicker.

This shell script will install the latest version of WordPress from wordpress.org, creates a new database, uses the WordPress API to generate new salts and updates your wp-config.php file.

Requirements:
  - wget
  - Must have MAMP running and your document root set to /Applications/MAMP/htdocs

Things to add:
  - Change MAMP root directory to $PROJECTNAME
  - Fallback to curl if wget is not installed.
  - Option to skip db name, user and pass entry.
  - Suggestions? Let me know!
