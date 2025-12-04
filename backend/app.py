from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

@app.route("/api")
def api():
    return jsonify({"message": "Backend working!"})

@app.route("/db")
def db_check():
    try:
        conn = psycopg2.connect(
            host=os.environ.get("DB_HOST"),
            database=os.environ.get("DB_NAME"),
            user=os.environ.get("DB_USER"),
            password=os.environ.get("DB_PASS")
        )
        conn.close()
        return jsonify({"message": "Database connected!"})
    except Exception as e:
        return str(e), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
