from fastapi import FastAPI # type: ignore
from pydantic import BaseModel # type: ignore

app = FastAPI()

class Item(BaseModel):
    name: str
    age: int

@app.post("/")
def create_item(i: Item, q: str):
    print(i)
    return 'Hello, World!'