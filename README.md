# Configuração do Ambiente PostgreSQL

Este projeto utiliza PostgreSQL executando no WSL (Ubuntu) e DBeaver como interface gráfica para administração e execução de consultas SQL.

## Pré-requisitos

- Windows 10 ou superior
- WSL instalado
- Distribuição Ubuntu instalada no WSL
- DBeaver Community Edition

---

## 1. Instalação do WSL

No PowerShell executado como administrador:

```powershell
wsl --install
```

Reinicie o computador após a instalação.

Para verificar o status:

```powershell
wsl --status
```

---

## 2. Atualização do Sistema

Abra o terminal Ubuntu e execute:

```bash
sudo apt update
sudo apt upgrade -y
```

---

## 3. Instalação do PostgreSQL

Instale o PostgreSQL e os componentes adicionais:

```bash
sudo apt install postgresql postgresql-contrib -y
```

Verifique a instalação:

```bash
psql --version
```

---

## 4. Inicialização do Serviço

Inicie o PostgreSQL:

```bash
sudo service postgresql start
```

Verifique se o serviço está ativo:

```bash
sudo service postgresql status
```

---

## 5. Configuração do Usuário

Acesse o console do PostgreSQL:

```bash
sudo -u postgres psql
```

Defina uma senha para o usuário administrador:

```sql
ALTER USER postgres PASSWORD 'sua_senha';
```

Crie um banco de dados para o projeto:

```sql
CREATE DATABASE nome_do_banco;
```

Saia do console:

```sql
\q
```

---

## 6. Configuração da Autenticação

Edite o arquivo de configuração:

```bash
sudo nano /etc/postgresql/*/main/pg_hba.conf
```

Localize as linhas:

```text
local   all             postgres        peer
local   all             all             peer
```

Altere para:

```text
local   all             postgres        md5
local   all             all             md5
```

Salve o arquivo e reinicie o PostgreSQL:

```bash
sudo service postgresql restart
```

---

## 7. Teste de Conexão

Teste a conexão utilizando senha:

```bash
psql -U postgres -h localhost
```

---

## 8. Instalação do DBeaver

Baixe e instale o DBeaver Community Edition.

Durante a criação da conexão PostgreSQL, utilize:

| Campo | Valor |
|---------|---------|
| Host | localhost |
| Porta | 5432 |
| Database | nome_do_banco |
| Usuário | postgres |
| Senha | senha configurada |

---

## 9. Problema com Download do Driver JDBC

Caso o DBeaver apresente o erro:

```text
Maven artifact 'org.postgresql:postgresql:RELEASE' cannot be resolved
```

Baixe manualmente o driver JDBC do PostgreSQL:

https://jdbc.postgresql.org/download/

No DBeaver:

1. Database → Driver Manager
2. PostgreSQL → Edit
3. Libraries → Add File
4. Selecione o arquivo `.jar` baixado

Após adicionar o driver, teste novamente a conexão.

---

## 10. Inicialização do Ambiente

Sempre que iniciar uma nova sessão no WSL:

```bash
sudo service postgresql start
```

Após isso, basta abrir o DBeaver e conectar-se ao banco de dados configurado.