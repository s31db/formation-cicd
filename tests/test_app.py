import requests

BASE_URL = "http://localhost:5000"


def test_hello_repond_200():
    response = requests.get(BASE_URL, timeout=5)
    assert response.status_code == 200


def test_hello_confirme_la_connexion_a_postgres():
    response = requests.get(BASE_URL, timeout=5)
    assert "Connecté à" in response.text