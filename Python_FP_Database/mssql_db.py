import pyodbc

db_server = "MENERIGS-MACHIN\SQLEXPRESS"
db_name = "LaserVideos"
db_driver = "ODBC Driver 17 for SQL Server"

connection_string = f"""
DRIVER={db_driver};
SERVER={db_server};
DATABASE={db_name};
trusted_connection=yes;
"""

# Only call, post, and update functions are needed as the databases already exist.
# There is no __init__ db 

class DB:
    def call_db(self, query, *args):
        data = None
        conn = pyodbc.connect(connection_string)
        cur = conn.cursor()
        if "SELECT" in query:
            res = cur.execute(query, args)
            data = res.fetchall()
            cur.commit()
            cur.close()
        else:
            conn.execute(query, args)
        conn.commit()
        conn.close()
        return data


if __name__ == "__main__":
    db = DB()
