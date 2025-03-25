from db_connection import conectar

conn = conectar()

if conn:
    conn.close()
    print("Conexão fechada.")
