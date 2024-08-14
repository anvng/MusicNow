from models.base import Base
from sqlalchemy import Column, TEXT, VARCHAR, LargeBinary # type: ignore


class User(Base):
    __tablename__ = "users"
    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100), unique = True, index=True)
    password = Column(LargeBinary)