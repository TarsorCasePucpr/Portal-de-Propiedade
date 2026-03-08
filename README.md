# Portal de Propiedade

Portal web para listagem, cadastro e gestão de propriedades.

## Estrutura do Projeto

```
Portal-de-Propiedade/
├── frontend/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   ├── main.js
│   │   └── validacoes.js
│   └── pages/
│       ├── index.html               # Home
│       ├── busca.html               # Busca de produto
│       ├── login.html               # Login
│       ├── cadastro-usuario.html    # Cadastro de usuário
│       ├── confirmacao.html         # Confirmação de cadastro
│       ├── recuperacao-senha.html   # Recuperação de senha
│       ├── mfa.html                 # Autenticação 2 fatores
│       ├── cadastro-produto.html    # Cadastro de produto
│       └── dashboard.html           # Dashboard
├── backend/
│   ├── config/
│   │   └── db.php                   # Conexão com banco de dados
│   ├── auth/
│   │   ├── login.php
│   │   ├── logout.php
│   │   ├── register.php
│   │   ├── confirm.php
│   │   ├── recover.php
│   │   └── mfa.php
│   ├── produto/
│   │   ├── cadastrar.php
│   │   ├── listar.php
│   │   ├── buscar.php
│   │   ├── status.php
│   │   └── contato.php
│   ├── middleware/
│   │   ├── auth_guard.php
│   │   ├── csrf.php
│   │   └── rate_limiter.php
│   └── utils/
│       ├── hash.php
│       ├── mailer.php
│       ├── response.php
│       └── secrets.php
├── database/
│   └── schema.sql
├── .env.example
└── .gitignore
```

## Requisitos

- PHP 8.1+
- MySQL 8.0+
- Servidor web (Apache / Nginx)

## Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/TarsorCasePucpr/Portal-de-Propiedade.git
   cd Portal-de-Propiedade
   ```

2. Copie o arquivo de variáveis de ambiente e preencha os valores:
   ```bash
   cp .env.example .env
   ```

3. Importe o schema do banco de dados:
   ```bash
   mysql -u root -p portal_propiedade < database/schema.sql
   ```

4. Configure o servidor web apontando para a raiz do projeto.

## Branches

| Branch    | Descrição                        |
|-----------|----------------------------------|
| `main`    | Código estável em produção       |
| `develop` | Branch de desenvolvimento ativo  |

## Licença

Uso interno. Todos os direitos reservados.
