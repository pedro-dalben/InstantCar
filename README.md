# Projeto Instant Car


## Instruções para configurar e rodar o projeto localmente

### Dependências principais
- Docker (Caso queira utilizar o postgres)
- asdf com plugins do Ruby e Nodejs

### Caso não queira usar asdf
- Ruby 3.1.2
- Rails ~> 7.1.3
- Bundler
- Nodejs 20.5.1
- Yarn
- Postgres ~> 15

1. Configure o arquivo `.env.development`.
2. Execute o setup do projeto pelo comando `./bin/setup`
3. Instale as dependências do Node.js com o comando `yarn`.
4. Rode o projeto `foreman start -f Procfile.dev`
