# Notification Service

Este README documenta os passos necessários para configurar e executar o `notification_service`.

### Versão do Ruby

- `3.1.6`

### Dependências do Sistema

- Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina.

### Configuração

1. Clone o repositório `notification_service`:

```bash
git clone https://github.com/Raphaelbsi/notification_service.git
cd notification_service
```

2. Construa e execute os contêineres Docker:

```bash
docker-compose up --build
```

3. Execute as migrações e popule o banco de dados:

```bash
docker-compose exec notification_service bundle exec rails db:create db:migrate
```

4. Execute a suíte de testes:

```bash
docker-compose exec notification_service bundle exec rspec
```

### Documentação da API

Endpoints de Notificações

- Listar Notificações
  - URL: /notifications
  - Método: GET
  - Resposta:

```json
[
  {
    "id": 1,
    "task_id": 123,
    "user_id": 456,
    "details": "Detalhes da notificação"
  },
  {
    "id": 2,
    "task_id": 124,
    "user_id": 457,
    "details": "Outros detalhes"
  }
]
```

- Criar Notificação
  - URL: /notifications
  - Método: POST
  - Corpo:

```json
{
  "notification": {
    "task_id": 123,
    "user_id": 456,
    "details": "Detalhes da notificação"
  }
}
```

- Resposta:

```json
{
  "status": "Notification created successfully"
}
```

## Exemplo de Comandos CURL

- Listar Notificações

```bash
curl --location 'http://localhost:3002/notifications'
```

- Criar Notificação

```bash
curl --location 'http://localhost:3002/notifications' \
--header 'Content-Type: application/json' \
--data '{
  "notification": {
    "task_id": 123,
    "user_id": 456,
    "details": "Detalhes da notificação"
  }
}'
```
