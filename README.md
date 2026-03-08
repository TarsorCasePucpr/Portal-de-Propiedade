# Portal de Propiedade

Sistema web de registro e rastreamento de objetos por número de série, com dois objetivos principais:

1. **Recuperação de objetos perdidos** — qualquer pessoa que encontre um objeto pode consultar o número de série, identificar o dono e acionar a devolução via autoridades.
2. **Eliminação do mercado secundário de roubados** — compradores podem verificar se um objeto está marcado como roubado antes de adquiri-lo, desincentivando o roubo pela queda de demanda.

---

## Por que esta ideia faz sentido

Quando um objeto roubado é registrado no sistema:
- O número de série fica marcado como **roubado/reportado**
- Qualquer pessoa no mercado secundário pode consultar antes de comprar
- Se o número de identificação foi raspado ou apagado, isso já sinaliza suspeita
- A demanda por objetos roubados cai → o risco do roubo aumenta → o crime se desincentiva

Quando um objeto é encontrado:
- A pessoa que encontrou consulta o serial → identifica o dono → notifica a polícia
- A polícia entra em contato com o dono → devolução facilitada

---

## Casos de uso

**UC1 — Registro de objeto**
Usuário cadastra seu objeto com número de série, categoria e descrição. Recebe um registro vinculado à sua conta.

**UC2 — Objeto perdido / roubado**
Dono marca o objeto como roubado. O serial fica público no sistema como "reportado".

**UC3 — Consulta pública**
Qualquer pessoa digita um número de série e vê: dono registrado, status (normal / reportado como roubado), sem expor dados pessoais do dono.

**UC4 — Objeto encontrado**
Pessoa encontra objeto, consulta serial, vê que tem dono → aciona a delegacia mais próxima com o número do registro.

**UC5 — Verificação antes de compra**
Comprador consulta serial do objeto que vai adquirir. Se marcado como roubado → não compra. Se serial apagado → sinal de alerta.

---

## Escopo — Objetos cobertos pelo sistema

Categorias e objetos prioritários (mais roubados e revendidos em mercado secundário):

### Eletrônicos
| # | Objeto |
|---|--------|
| 1 | Smartphone (iPhone, Samsung, etc.) |
| 2 | Notebook / Laptop |
| 3 | Tablet (iPad, etc.) |
| 4 | Smartwatch (Apple Watch, etc.) |
| 5 | Fones sem fio (AirPods, etc.) |
| 6 | Câmera fotográfica (DSLR / mirrorless) |
| 7 | Console de videogame (PlayStation, Xbox) |
| 8 | Nintendo Switch / portátil |
| 9 | Controle de videogame |
| 10 | Drone |
| 11 | Smart speaker (Echo, Google Nest) |
| 12 | Projetor portátil |
| 13 | E-reader (Kindle, etc.) |

### Transporte
| # | Objeto |
|---|--------|
| 14 | Bicicleta (convencional) |
| 15 | Bicicleta elétrica (e-bike) |
| 16 | Patinete elétrico |
| 17 | Moto (documentação vinculada ao serial do chassi) |
| 18 | GPS automotivo |
| 19 | Rádio / som automotivo |
| 20 | Rodas e pneus de carro |

### Ferramentas e equipamentos
| # | Objeto |
|---|--------|
| 21 | Furadeira / parafusadeira elétrica |
| 22 | Serra circular |
| 23 | Esmerilhadeira |
| 24 | Gerador de energia |
| 25 | Compressor de ar |
| 26 | Lavadora de alta pressão |
| 27 | Equipamento de solda |
| 28 | Motosserra |

### Instrumentos musicais
| # | Objeto |
|---|--------|
| 29 | Guitarra elétrica |
| 30 | Guitarra acústica / violão |
| 31 | Baixo elétrico |
| 32 | Teclado / sintetizador |
| 33 | Bateria eletrônica |
| 34 | Amplificador |
| 35 | Microfone profissional |
| 36 | Mesa de som / mixer |
| 37 | Controlador DJ |

### Equipamentos de imagem e som
| # | Objeto |
|---|--------|
| 38 | Televisão |
| 39 | Caixa de som portátil (JBL, etc.) |
| 40 | Sistema de home theater |
| 41 | Câmera de segurança |
| 42 | Filmadora |
| 43 | Estabilizador de câmera (gimbal) |

### Esportes e lazer
| # | Objeto |
|---|--------|
| 44 | Bicicleta de montanha (MTB) |
| 45 | Prancha de surf |
| 46 | Skate / longboard |
| 47 | Tacos de golfe (jogo completo) |
| 48 | Equipamento de mergulho |
| 49 | Kayak / caiaque |
| 50 | Patins inline |
| 51 | Equipamento de crossfit / musculação portátil |

### Joias e relógios
| # | Objeto |
|---|--------|
| 52 | Relógio de pulso (analógico de valor) |
| 53 | Anel |
| 54 | Colar / corrente |
| 55 | Pulseira |
| 56 | Brincos de valor |

### Malas e bolsas
| # | Objeto |
|---|--------|
| 57 | Mochila (especialmente com eletrônicos) |
| 58 | Bolsa de couro / grife |
| 59 | Mala de viagem |

### Outros
| # | Objeto |
|---|--------|
| 60 | Cadeira de rodas / scooter de mobilidade |
| 61 | Equipamento médico portátil |
| 62 | Máquina de cartão (POS) |
| 63 | Impressora portátil |
| 64 | Roteador / equipamento de rede |
| 65 | Extintor de incêndio (veicular) |

---

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
│       ├── busca.html               # Busca pública por serial
│       ├── login.html               # Login
│       ├── cadastro-usuario.html    # Cadastro de usuário
│       ├── confirmacao.html         # Confirmação de cadastro
│       ├── recuperacao-senha.html   # Recuperação de senha
│       ├── mfa.html                 # Autenticação 2 fatores
│       ├── cadastro-produto.html    # Registro de objeto
│       └── dashboard.html           # Painel do usuário
├── backend/
│   ├── config/
│   │   └── db.php                   # Conexão PDO
│   ├── auth/
│   │   ├── login.php
│   │   ├── logout.php
│   │   ├── register.php
│   │   ├── confirm.php
│   │   ├── recover.php
│   │   └── mfa.php
│   ├── middleware/
│   │   ├── auth_guard.php
│   │   ├── csrf.php
│   │   └── rate_limiter.php
│   ├── produto/
│   │   ├── cadastrar.php
│   │   ├── listar.php
│   │   ├── buscar.php
│   │   ├── status.php
│   │   └── contato.php
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

---

## Workflow Git — Equipe de 5 pessoas

```
main       ← entrega final
└── develop ← integração contínua
    ├── feature/pessoa1   (index + busca)
    ├── feature/pessoa2   (login + cadastro-usuario)
    ├── feature/pessoa3   (confirmacao + recuperacao-senha)
    ├── feature/pessoa4   (mfa + cadastro-produto)
    └── feature/pessoa5   (dashboard + backend)
```

**Por pessoa:**
```bash
git checkout develop && git pull origin develop
git checkout -b feature/seunome
# trabalhar nas páginas atribuídas
git add . && git commit -m "Add: pagina-x e pagina-y"
git push origin feature/seunome
# → abrir Pull Request para develop
```

---

## Requisitos

- PHP 8.1+
- MySQL 8.0+
- Servidor web (Apache / Nginx)
- Composer

---

## Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/TarsorCasePucpr/Portal-de-Propiedade.git
   cd Portal-de-Propiedade
   ```

2. Instale as dependências:
   ```bash
   composer install
   ```

3. Configure o ambiente:
   ```bash
   cp .env.example .env
   # editar .env com suas credenciais
   ```

4. Importe o banco de dados:
   ```bash
   mysql -u root -p portal_propiedade < database/schema.sql
   ```

5. Configure o servidor web apontando para a raiz do projeto.

---

## Branches

| Branch | Descrição |
|--------|-----------|
| `main` | Código estável — entrega final |
| `develop` | Desenvolvimento ativo |
| `feature/*` | Branch por integrante |

---

## Licença

Uso interno. Todos os direitos reservados.
