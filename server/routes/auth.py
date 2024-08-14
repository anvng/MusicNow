from fastapi import Depends, HTTPException # type: ignore
import uuid
import bcrypt # type: ignore
from fastapi import APIRouter # type: ignore
from pydantic_schemas.user_create import UserCreate
from models.user import User
from database import get_db
from sqlalchemy.orm import Session # type: ignore


router = APIRouter()

@router.post('/register')
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