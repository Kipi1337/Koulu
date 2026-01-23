from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base, Session
from pydantic import BaseModel

app = FastAPI()

# Tietokanta-asetukset
DATABASE_URL = "sqlite:///./customers.db"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()

# Asiakas-malli SQLAlchemy
class Customer(Base):
    __tablename__ = "customers"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String, index=True)
    last_name = Column(String, index=True)
    email = Column(String, unique=True, index=True)
    phone = Column(String, unique=True)
    address = Column(String)

Base.metadata.create_all(bind=engine)

# Pydantic-malli (input validation)
class CustomerCreate(BaseModel):
    first_name: str
    last_name: str
    email: str
    phone: str
    address: str

# Tietokantaistunnon riippuvuus
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Hae kaikki asiakkaat
@app.get("/customers")
def get_customers(db: Session = Depends(get_db)):
    return db.query(Customer).all()

# Hae yksittäinen asiakas ID:llä
@app.get("/customers/{customer_id}")
def get_customer(customer_id: int, db: Session = Depends(get_db)):
    customer = db.query(Customer).filter(Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    return customer

# Lisää uusi asiakas
@app.post("/customers")
def create_customer(customer: CustomerCreate, db: Session = Depends(get_db)):
    new_customer = Customer(**customer.dict())
    db.add(new_customer)
    db.commit()
    db.refresh(new_customer)
    return new_customer

# Päivitä asiakastiedot
@app.put("/customers/{customer_id}")
def update_customer(customer_id: int, updated_customer: CustomerCreate, db: Session = Depends(get_db)):
    customer = db.query(Customer).filter(Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    
    for key, value in updated_customer.dict().items():
        setattr(customer, key, value)
    
    db.commit()
    db.refresh(customer)
    return customer

# Poista asiakas
@app.delete("/customers/{customer_id}")
def delete_customer(customer_id: int, db: Session = Depends(get_db)):
    customer = db.query(Customer).filter(Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    
    db.delete(customer)
    db.commit()
    return {"message": "Customer deleted successfully"}
