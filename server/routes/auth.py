from fastapi import Depends, HTTPException # type: ignore
import uuid
import bcrypt # type: ignore
from fastapi import APIRouter # type: ignore
from pydantic_schemas.user_create import UserCreate
from models.user import User
from database import get_db
from pydantic_schemas.user_login import UserLogin
from sqlalchemy.orm import Session # type: ignore


router = APIRouter()

@router.post('/register', status_code=201)
def register_user(user: UserCreate, db: Session = Depends(get_db)):
    user_db = db.query(User).filter_by(email=user.email).first()

    if user_db:
        raise HTTPException(400, "User with this email already exists!")
    
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    user_db = User(id=str(uuid.uuid4()), email=user.email, password=hashed_password)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db

@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    user_db = db.query(User).filter_by(email=user.email).first()

    if not user_db:
        raise HTTPException(404, "User not found!")

    if not bcrypt.checkpw(user.password.encode('utf-8'), user_db.password):
        raise HTTPException(401, "Wrong password!")
    

    return user_db