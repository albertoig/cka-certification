## How to start the backend example
On the `backend` folder run the enxt commands:
1. Install dependencies: 
```bash
poetry install
```
2. Install dependencies: 
```bash
poetry shell
```
3. Run the project in development mode:
```bash
uvicorn backend.main:app --reload
# OR
fastapi dev backend/main.py
```
4. Check the URL `localhost:8080`:
```bash
curl localhost:8000
```
If you see `{"Hello":"World"}` then the example is working.

> [!NOTE]
> The project can be run also directly from poetry with `poetry run start`, if so, you can skip the step 2 and 3.

## How to test the Dockerfile
1. Build the dockerfile:
```bash
docker build . -t test
```
2. Run the image: 
```bash
docker run -d -p 8000:8000 --name test test
```
3. Check the URL `localhost:8080`:
```bash
curl localhost:8000
```
If you see `{"Hello":"World"}` then the example is working.
