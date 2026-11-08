import os
import psycopg2
from flask import Flask

app = Flask(__name__)


def get_connection():
    return psycopg2.connect(
        host="db",
        dbname=os.environ["POSTGRES_DB"],
        user=os.environ["POSTGRES_USER"],
        password=os.environ["POSTGRES_PASSWORD"],
    )


@app.route("/")
def hello():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT version();")
    version = cur.fetchone()[0]
    conn.close()
    return f"Connecté à : {version}\n"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
