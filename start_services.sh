#!/bin/bash

# Navigate to the nostrosole directory
cd /var/www/html/nostrosole

# Navigate to the frontend directory and start the frontend server
cd front-end
npm install
npm run dev &

# Navigate to the backend directory, install dependencies, and start the backend server
cd ../back-end
composer install
php artisan key:generate
php artisan migrate:fresh --seed
php artisan passport:install
php artisan passport:client --personal
php artisan storage:link
php artisan serve --host=0.0.0.0 --port=8000 &
