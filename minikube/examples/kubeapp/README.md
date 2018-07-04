
docker
- build: `docker build -t kubeapp:v1 .`
- run img: `docker run --rm -p 3000:3000 kubeapp:v1`
- run dev env: `docker run --rm -v $(pwd):/workspace -w /workspace -p 3000:3000 node:8.11.3-alpine sh -c "npm install; npm run dev"`

kubernetes
- 