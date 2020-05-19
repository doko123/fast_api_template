from fastapi import FastAPI

app = FastAPI()


async def get_response():
    return {"Hello": "World"}


@app.get("/")
async def read_root():
    response = await get_response()
    return response


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
