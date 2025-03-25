from db_operations import (
    inserir_hotel, listar_hoteis,
    inserir_cliente, listar_clientes,
    inserir_quarto, listar_quartos,
    inserir_reserva, listar_reservas, inserir_pagamento, listar_pagamentos, atualizar_cliente, deletar_quarto,
    deletar_reserva, deletar_pagamento, deletar_hotel, deletar_cliente, atualizar_quarto, listar_reservas_com_detalhes,
    listar_quartos_disponiveis, faturamento_por_hotel, clientes_frequentes, taxa_ocupacao_hotel
)
# Inserir um hotel
#inserir_hotel("Hotel Krat",
             # "Rua gamer, 123", "11-99999-9999", "5 estrelas",
            #  "Assis", "SP")

# Listar hotéis
#listar_hoteis()

# Inserir um cliente
#inserir_cliente("Jordão", "22211133345",
               # "11-98888-7777", "jordao@email.com")

# Listar clientes
#listar_clientes()

#atualizar_cliente(1,"18-98888-8888")

# Inserir um quarto no hotel ID 1
#inserir_quarto(1, 102, "Deluxe", 250.00, "Disponível")

# Listar quartos
#listar_quartos()

# Criar uma reserva para o cliente ID 1 no quarto ID 1
#inserir_reserva(1, 1, "2025-02-20",
              #  "2025-02-25", "Ativa")

# Listar reservas
#listar_reservas()

#inserir_pagamento(1, 250.00, "Cartão", "Pago")

#listar_pagamentos()
#atualizar_quarto(1,"Ocupado", 120.00, "Comum")

listar_reservas_com_detalhes()

#inserir_quarto(1,103, "Suite", 150.00, "Disponível")
deletar_quarto(1)
listar_quartos_disponiveis(1)

#inserir_pagamento(1, 120.00, "PIX", "Pago")
deletar_pagamento(1)

faturamento_por_hotel()

clientes_frequentes(1)
taxa_ocupacao_hotel(1)
