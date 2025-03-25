import psycopg2

def conectar():
    try:
        conn = psycopg2.connect(
            dbname="hotel",
            user="postgres",
            password="jordao123",
            host="localhost",
            port="5432"
        )
        print("Conexão bem-sucedida!")
        return conn
    except Exception as e:
        print(f"Erro na conexão: {e}")
        return None
