# On any failed command, exit the program with an error message
set -e
trap "The program failed. Exiting..." ERR

DATABASE_USER="drupal1"
DATABASE_NAME="drupal1"
DATABASE_BACKUP="./mis-backups/database_backup.sql"

rm -v "$DATABASE_BACKUP"
mysqldump -u "$DATABASE_USER" -p "$DATABASE_NAME" > "$DATABASE_BACKUP"

git add .
git commit -m "$1"
git push