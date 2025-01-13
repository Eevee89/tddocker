# TD Docker

## Build

Run : ```docker build -t phpdocker .```

- The dockerfile will create an image, extending the PHP8.2-cli-alpine one.
- Then add the needed binaries.
- Then install composer and php extensions.
- And finally clone source git and install dependencies.

## Compose 

Run : ```docker-compose up --build```

- The composer will create 3 services :
  - A container rabbitmq for communication between server and client
  - A container php-server to run the server.php script (base on the phpdocker image built before)
  - A container php-client to run the client.php script (base on the phpdocker image built before)
- We create also a volume rabbitmq_data to make the datas of rabbitmq persistent through builds

## Workflow

![Workflow](./workflow.png)
