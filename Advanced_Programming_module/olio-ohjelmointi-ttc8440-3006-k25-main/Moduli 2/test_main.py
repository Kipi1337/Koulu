from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_get_customers():
    response = client.get("/customers")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

def test_create_customer():
    response = client.post("/customers", json={
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com",
        "phone": "123456789",
        "address": "123 Street"
    })
    assert response.status_code == 200
    assert response.json()["first_name"] == "John"
