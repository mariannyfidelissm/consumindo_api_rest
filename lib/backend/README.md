# Passos importantes 

## Instale as bibliotecas

1. __$ *npm install knex cors dotenv sqlite3*__

2. Depois de instalado delete o arquivo da pasta /backend/db/ chamado *dev.sqlite3*

3. Crie um arquivo .env  e coloque em seu conteúdo a porta onde o servidor ouvirá e o ambiente de execução.
    **PORT**=34567
    **NODE_ENV**=development

## Crie suas migrations e seeds

* Você deve criar suas próprias __*migrations*__ e __*seeds*__
  * Existem exemplos na documentação de como criar migrations e seeds

### Seeds
* O comando abaixo cria na pasta epecificada pelo arquivo knex.js uma seed chamada de *tarefas*. É nesse arquivo que você irá colocar os dados que deseja popular o seu banco de dados.

  * _**$ npx seed:make tarefas**_

### Migration

* Para criar um arquivo de controle de versão no seu banco de dados você deve criar uma migration para a tabela tarefas.

* É nesse arquivo migration de tarefas que você escreve a criação e deleção da tabela tarefas. 

* É normal ao criar o arquivo um número ser colocado na frente do arquivo. Não edite ele !!!
  * _**$ npx migrate:make tarefas**_

**Observação: você deverá editar o conteúdo e não o nome do arquivo !**

### Executando o projeto 
* __$ *npm run dev*__ --> executa o servidor
* __$ *npm run reset-db*__ --> reexecuta seu banco de dados

# Explicação dos arquivos

* Migrations - 
  
* Seeds - 


## Knex.js
O arquivo knex.js é o arquivo responsável pelas configurações do ambiente de banco de dados que será executado no projeto.

Nesse arquivo é possível descrever diferentes conexões para diferentes banco de dados, bem como a descrição dos diretório para as _migrations_ e _seeds_.

No site do query builder knex tem exemplos diversos para as mais diferentes situações.

## Server.js

Arquivo onde está a configuração do servidor da API e a importação das rotas (endpoints) que serão implementados.

## Route.js

Arquivo onde serão implementadas todas as rotas (endpoints do servidor)

Nele que estão implementados os métodos (GET, POST, PUT e DELETE)

## Controllers/TarefaController.js

Na arquitetura de softwre implementada nesse projeto MVC é função do controller implementar a mediação com o backend.

É interessante para cada entidade um controller específico. No nosso exemplo de Controle de Tarefas teremos um TarefaController encarregado de buscar, salvar e deletar as tarefas em um banco de dados.

Os controllers devem possuir métodos referentes aos CRUDS de uma aplicação. É no controle que os dados das requisições são processados e retornados (response) com o devido tratamento.

# Referências bibliográficas

Observação: as referências abaixo estão sendo usadas como referências para implementação dos exemplos e materiais de aula.

* [Guia do Knex](https://knexjs.org/guide/query-builder.html)

* [Documentação NodeJs](https://nodejs.org/en/docs/guides/getting-started-guide/)
  
* [Como utilizar o Postgres com o Knex em API NodeJs](https://dev.to/jimmymcbride/how-to-use-postgres-with-knex-on-your-node-api-4k8h)

* [Criando um projento fim a fim com Node e Flutter](https://thiagoevoa.medium.com/creating-an-end-to-end-project-from-node-js-backend-to-flutter-app-a8df8ffdde5b)

