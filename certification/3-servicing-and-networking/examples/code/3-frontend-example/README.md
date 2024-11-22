## How to start the frotend example for developing
On the `3-frontend` folder run the enxt commands:
1. Install dependencies: 
```bash
npm install
```
2. Set up environment variables
```bash
# set in the .env file in the root 3-frontend folder
BACKEND_URL=http://localhost:8000
```
2. Run the project
```bash
npm run dev
```
Run in the navigator the URL `http://localhost:3000/`
If you see `Hello, This is the Frontend Example of the CKA exam! The backend call result is {"Hello":"World"}` then the example is working.


## How to test the Dockerfile
1. Build the dockerfile:
```bash
docker build . -t 3-frontend-test
```
2. Run the image: 
```bash
docker run -p 3000:3000 --name 3-frontend 3-frontend-test
```
3. Check the URL `localhost:3000`:
```bash
curl localhost:3000
```

Run in the navigator the URL `http://localhost:3000/`
If you see `Hello, This is the Frontend Example of the CKA exam! The backend call result is {"Hello":"World"}` then the example is working.

