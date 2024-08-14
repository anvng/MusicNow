from fastapi import FastAPI # type: ignore
from routes import auth
from database import Base
from database import engine

Base.metadata.create_all(bind=engine)



app = FastAPI()
app.include_router(auth.router, prefix="/auth")


Base.metadata.create_all(bind=engine)