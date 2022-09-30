# Basic instructions to run

1. Clone the repo
2. Create a schema in MySQL for the project
3. Copy .env.example to .env
4. Update .env with: (a) name of your DB schema,  (b) the DB username / password.
5. Open a terminal in the project root directory and run:
```
for laravel_api

composer install

npm install

php artisan migrate

php artisan db:seed

php artisan serve
```

Navigate to: http://localhost:8000


for flutter

flutter run 


For running on localhost!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

turn on xamp - apache, mySQL

on backend laravel_api
<your ip6 aadrres here>
php artisan serve --host  111.111.11.102  --port 8080 

on flutter change line in lib/dio.dart
     change this ->  baseUrl: 'http://111.111.11.102:8080/api/',
     change this ->  baseUrl: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
     
     
     <your addres here ip6 same as serving
     to -> baseUrl: 'http://192.111.111.102:8080/api/',
