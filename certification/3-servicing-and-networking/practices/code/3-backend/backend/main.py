import uvicorn

from typing import Union
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

def start():
    """Launched with `poetry run start` at root level"""
    uvicorn.run("backend.main:app", host="0.0.0.0", port=8000, reload=True)
