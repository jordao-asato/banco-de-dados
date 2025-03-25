from db_connection import conectar

def inserir_cliente(nome, cpf, telefone, email):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO Cliente (nome, cpf, telefone, email) 
                VALUES (%s, %s, %s, %s)
            """, (nome, cpf, telefone, email))
            conn.commit()
            print("Cliente inserido com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir cliente: {e}")
        finally:
            cur.close()
            conn.close()

def listar_clientes():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("SELECT * FROM Cliente")
            clientes = cur.fetchall()
            for cliente in clientes:
                print(cliente)
        except Exception as e:
            print(f"Erro ao listar clientes: {e}")
        finally:
            cur.close()
            conn.close()

def deletar_cliente(id_cliente):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM Cliente WHERE id_cliente = %s", (id_cliente,))
            conn.commit()
            print("Cliente deletado com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar cliente: {e}")
        finally:
            cur.close()
            conn.close()

def inserir_hotel(nome, endereco, telefone, categoria, cidade, estado):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO Hotel (nome, endereco, telefone, categoria, cidade, estado) 
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (nome, endereco, telefone, categoria, cidade, estado))
            conn.commit()
            print("Hotel inserido com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir hotel: {e}")
        finally:
            cur.close()
            conn.close()

def listar_hoteis():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("SELECT * FROM Hotel")
            hoteis = cur.fetchall()
            for hotel in hoteis:
                print(hotel)
        except Exception as e:
            print(f"Erro ao listar hotéis: {e}")
        finally:
            cur.close()
            conn.close()

def inserir_quarto(id_hotel, numero, tipo, preco_diaria, status):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO Quarto (id_hotel, numero, tipo, preco_diaria, status) 
                VALUES (%s, %s, %s, %s, %s)
            """, (id_hotel, numero, tipo, preco_diaria, status))
            conn.commit()
            print("Quarto inserido com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir quarto: {e}")
        finally:
            cur.close()
            conn.close()

def listar_quartos():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("SELECT * FROM Quarto")
            quartos = cur.fetchall()
            for quarto in quartos:
                print(quarto)
        except Exception as e:
            print(f"Erro ao listar quartos: {e}")
        finally:
            cur.close()
            conn.close()

def inserir_reserva(id_cliente, id_quarto, data_checkin, data_checkout, status):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO Reserva (id_cliente, id_quarto, data_checkin, data_checkout, status) 
                VALUES (%s, %s, %s, %s, %s)
            """, (id_cliente, id_quarto, data_checkin, data_checkout, status))
            conn.commit()
            print("Reserva inserida com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir reserva: {e}")
        finally:
            cur.close()
            conn.close()

def listar_reservas():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("SELECT * FROM Reserva")
            reservas = cur.fetchall()
            for reserva in reservas:
                print(reserva)
        except Exception as e:
            print(f"Erro ao listar reservas: {e}")
        finally:
            cur.close()
            conn.close()

def inserir_pagamento(id_reserva, valor_total, metodo_pagamento, status_pagamento):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO Pagamento(id_reserva, valor_total, metodo_pagamento, status_pagamento)
                VALUES(%s, %s, %s, %s)
            """, (id_reserva, valor_total, metodo_pagamento, status_pagamento))
            conn.commit()
            print("Pagamento inserido com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir pagamento: {e}")
        finally:
            cur.close()
            conn.close()

def listar_pagamentos():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("SELECT * FROM Pagamento")
            pagamentos = cur.fetchall()
            for pagamento in pagamentos:
                print(pagamento)
        except Exception as e:
            print(f"Erro ao listar pagamentos: {e}")
        finally:
            cur.close()
            conn.close()

# Atualizar dados do cliente
def atualizar_cliente(id_cliente, novo_telefone=None, novo_email=None):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            if novo_telefone:
                cur.execute("UPDATE Cliente SET telefone = %s WHERE id_cliente = %s", (novo_telefone, id_cliente))
            if novo_email:
                cur.execute("UPDATE Cliente SET email = %s WHERE id_cliente = %s", (novo_email, id_cliente))
            conn.commit()
            print("Cliente atualizado com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar cliente: {e}")
        finally:
            cur.close()
            conn.close()

# Atualizar dados do hotel
def atualizar_hotel(id_hotel, novo_telefone=None, nova_categoria=None, novo_endereco=None):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            if novo_telefone:
                cur.execute("UPDATE Hotel SET telefone = %s WHERE id_hotel = %s", (novo_telefone, id_hotel))
            if nova_categoria:
                cur.execute("UPDATE Hotel SET categoria = %s WHERE id_hotel = %s", (nova_categoria, id_hotel))
            if novo_endereco:
                cur.execute("UPDATE Hotel SET endereco = %s WHERE id_hotel = %s", (novo_endereco, id_hotel))
            conn.commit()
            print("Hotel atualizado com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar hotel: {e}")
        finally:
            cur.close()
            conn.close()

# Atualizar dados do quarto
def atualizar_quarto(id_quarto, novo_status=None, novo_preco=None, novo_tipo=None):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            if novo_status:
                cur.execute("UPDATE Quarto SET status = %s WHERE id_quarto = %s", (novo_status, id_quarto))
            if novo_preco:
                cur.execute("UPDATE Quarto SET preco_diaria = %s WHERE id_quarto = %s", (novo_preco, id_quarto))
            if novo_tipo:
                cur.execute("UPDATE Quarto SET tipo = %s WHERE id_quarto = %s", (novo_tipo, id_quarto))
            conn.commit()
            print("Quarto atualizado com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar quarto: {e}")
        finally:
            cur.close()
            conn.close()

# Atualizar status ou datas da reserva
def atualizar_reserva(id_reserva, novo_status=None, nova_data_checkin=None, nova_data_checkout=None):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            if novo_status:
                cur.execute("UPDATE Reserva SET status = %s WHERE id_reserva = %s", (novo_status, id_reserva))
            if nova_data_checkin:
                cur.execute("UPDATE Reserva SET data_checkin = %s WHERE id_reserva = %s", (nova_data_checkin, id_reserva))
            if nova_data_checkout:
                cur.execute("UPDATE Reserva SET data_checkout = %s WHERE id_reserva = %s", (nova_data_checkout, id_reserva))
            conn.commit()
            print("Reserva atualizada com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar reserva: {e}")
        finally:
            cur.close()
            conn.close()

# Atualizar status ou valor do pagamento
def atualizar_pagamento(id_pagamento, novo_status_pagamento=None, novo_valor_total=None):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            if novo_status_pagamento:
                cur.execute("UPDATE Pagamento SET status_pagamento = %s WHERE id_pagamento = %s", (novo_status_pagamento, id_pagamento))
            if novo_valor_total:
                cur.execute("UPDATE Pagamento SET valor_total = %s WHERE id_pagamento = %s", (novo_valor_total, id_pagamento))
            conn.commit()
            print("Pagamento atualizado com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar pagamento: {e}")
        finally:
            cur.close()
            conn.close()

# Remover hotel
def deletar_hotel(id_hotel):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM Hotel WHERE id_hotel = %s", (id_hotel,))
            conn.commit()
            print("Hotel deletado com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar hotel: {e}")
        finally:
            cur.close()
            conn.close()

# Remover quarto
def deletar_quarto(id_quarto):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM Quarto WHERE id_quarto = %s", (id_quarto,))
            conn.commit()
            print("Quarto deletado com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar quarto: {e}")
        finally:
            cur.close()
            conn.close()

# Remover reserva
def deletar_reserva(id_reserva):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM Reserva WHERE id_reserva = %s", (id_reserva,))
            conn.commit()
            print("Reserva deletada com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar reserva: {e}")
        finally:
            cur.close()
            conn.close()

# Remover pagamento
def deletar_pagamento(id_pagamento):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM Pagamento WHERE id_pagamento = %s", (id_pagamento,))
            conn.commit()
            print("Pagamento deletado com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar pagamento: {e}")
        finally:
            cur.close()
            conn.close()


# Junta as tabelas reserva, cliente, quarto e hotel
# Retorna detalhes do cliente, hotel, número do quarto, datas da reserva e status.
def listar_reservas_com_detalhes():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                SELECT 
                    r.id_reserva, c.nome AS cliente, h.nome AS hotel, q.numero AS quarto,
                    r.data_checkin, r.data_checkout, r.status
                FROM reserva r
                JOIN cliente c ON r.id_cliente = c.id_cliente
                JOIN quarto q ON r.id_quarto = q.id_quarto
                JOIN hotel h ON q.id_hotel = h.id_hotel
                ORDER BY r.data_checkin;
            """)
            reservas = cur.fetchall()
            for reserva in reservas:
                print(reserva)
        except Exception as e:
            print(f"Erro ao listar reservas: {e}")
        finally:
            cur.close()
            conn.close()


# Filtra quartos disponíveis (status = 'Disponível') para um hotel específico (id_hotel).
# Ordena os quartos pelo preço (do mais barato ao mais caro).
def listar_quartos_disponiveis(id_hotel):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                SELECT id_quarto, numero, tipo, preco_diaria 
                FROM quarto
                WHERE id_hotel = %s AND status = 'Disponível'
                ORDER BY preco_diaria;
            """, (id_hotel,))
            quartos = cur.fetchall()
            for quarto in quartos:
                print(quarto)
        except Exception as e:
            print(f"Erro ao listar quartos disponíveis: {e}")
        finally:
            cur.close()
            conn.close()


# Soma o total faturado por hotel com base nos pagamentos.
# Considera apenas pagamentos confirmados (status_pagamento = 'Pago').
def faturamento_por_hotel():
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                SELECT h.nome AS hotel, SUM(p.valor_total) AS total_faturado
                FROM pagamento p
                JOIN reserva r ON p.id_reserva = r.id_reserva
                JOIN quarto q ON r.id_quarto = q.id_quarto
                JOIN hotel h ON q.id_hotel = h.id_hotel
                WHERE p.status_pagamento = 'Pago'
                GROUP BY h.nome
                ORDER BY total_faturado DESC;
            """)
            faturamento = cur.fetchall()
            for hotel in faturamento:
                print(hotel)
        except Exception as e:
            print(f"Erro ao calcular faturamento: {e}")
        finally:
            cur.close()
            conn.close()


# Listar clientes que fizeram mais de X reservas
# Conta o número de reservas de cada cliente.
# Filtra quem tem pelo menos X reservas (HAVING COUNT(r.id_reserva) >= min_reservas).
# Ordena do cliente mais fiel para o menos frequente.
def clientes_frequentes(min_reservas):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                SELECT c.nome, COUNT(r.id_reserva) AS total_reservas
                FROM cliente c
                JOIN reserva r ON c.id_cliente = r.id_cliente
                GROUP BY c.nome
                HAVING COUNT(r.id_reserva) >= %s
                ORDER BY total_reservas DESC;
            """, (min_reservas,))
            clientes = cur.fetchall()
            for cliente in clientes:
                print(cliente)
        except Exception as e:
            print(f"Erro ao listar clientes frequentes: {e}")
        finally:
            cur.close()
            conn.close()


# Relatório de ocupação de um hotel específico
# Calcula a taxa de ocupação (% de quartos reservados) de um hotel específico.
# Usa COUNT(id_reserva) * 100.0 / COUNT(id_quarto) para calcular a porcentagem.
# Retorna a ocupação em percentual arredondado (ROUND(..., 2)).
def taxa_ocupacao_hotel(id_hotel):
    conn = conectar()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute("""
                SELECT 
                    h.nome AS hotel, 
                    COUNT(r.id_reserva) AS total_reservas, 
                    ROUND((COUNT(r.id_reserva) * 100.0 / COUNT(q.id_quarto)), 2) AS taxa_ocupacao
                FROM hotel h
                JOIN quarto q ON h.id_hotel = q.id_hotel
                LEFT JOIN reserva r ON q.id_quarto = r.id_quarto
                WHERE h.id_hotel = %s
                GROUP BY h.nome;
            """, (id_hotel,))
            ocupacao = cur.fetchall()
            for taxa in ocupacao:
                print(taxa)
        except Exception as e:
            print(f"Erro ao calcular taxa de ocupação: {e}")
        finally:
            cur.close()
            conn.close()
