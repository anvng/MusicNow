from http.client import HTTPException
import uuid
import bcrypt # type: ignore
from fastapi import FastAPI # type: ignore
from fastapi import HTTPException # type: ignore
from pydantic import BaseModel # type: ignore
from sqlalchemy import create_engine # type: ignore
from sqlalchemy.orm import sessionmaker # type: ignore
from sqlalchemy.ext.declarative import declarative_base # type: ignore
from sqlalchemy import Column, TEXT, VARCHAR, LargeBinary # type: ignore



app = FastAPI()

DATABASE_URL = "postgresql://postgres:admin@localhost:5432/musicnow"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

db = SessionLocal()

class UserCreate(BaseModel):
    name: str
    email: str
    password: str


Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100)) 
    email = Column(VARCHAR(100), unique = True, index=True)
    password = Column(LargeBinary)



@app.post('/register')
def register_user(user: UserCreate):
    user_db = db.query(User).filter_by(email=user.email).first()

    if user_db:
        raise HTTPException(400, "User with this email already exists!")
    
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    user_db = User(id=str(uuid.uuid4()), email=user.email, password=hashed_password)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db

Base.metadata.create_all(bind=engine)