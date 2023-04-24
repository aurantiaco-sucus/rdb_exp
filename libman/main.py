import sqlite3

DB_PATH = './lib.db'

SENTENCE_INIT_DB = """
create table if not exists lib_cur (
id integer primary key,

""".strip()

def init_db():
    db = sqlite3.connect(DB_PATH)
    cur = db.cursor()
    cur.execute("create table if not exists ")