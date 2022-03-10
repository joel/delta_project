docker run --rm \
  --env RAILS_ENV=test  \
  --env DB_HOST=demo-db  \
  --env DB_PORT=5432  \
  --env DB_PASSWORD=db_password  \
  --env DB_USER=postgres \
  --network=demo-bridge-docker-network \
  demo/app-ci:0.1.0 /bin/bash -c "bin/rails db:prepare"

  docker run --rm \
    --env RAILS_ENV=test  \
    --env DB_HOST=demo-db  \
    --env DB_PORT=5432  \
    --env DB_PASSWORD=db_password  \
    --env DB_USER=postgres \
    --network=demo-bridge-docker-network \
    demo/app-ci:0.1.0 /bin/bash -c "bin/rails test"
