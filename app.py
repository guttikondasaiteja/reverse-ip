from flask import Flask, request
import sqlite3

app = Flask(__name__)

# Database setup
def init_db():
    conn = sqlite3.connect('ip_storage.db')
    c = conn.cursor()
    c.execute('CREATE TABLE IF NOT EXISTS ip_records (id INTEGER PRIMARY KEY, reverse_ip TEXT)')
    conn.commit()
    conn.close()

@app.route('/')
def home():
    public_ip = request.remote_addr
    reverse_ip = '.'.join(public_ip.split('.')[::-1])
    
    # Store reverse IP in the database
    conn = sqlite3.connect('ip_storage.db')
    c = conn.cursor()
    c.execute('INSERT INTO ip_records (reverse_ip) VALUES (?)', (reverse_ip,))
    conn.commit()
    conn.close()
    
    return reverse_ip

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=8080)
