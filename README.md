# CONVISO API by Júlia

Bem vindo ao projeto Conviso API, uma API criada com as gems JWT, bcrypt e Paranoia, testada com Postman, e embalada com Docker, por alguém que até uma semana atrás não conhecia nenhuma dessas coisas.   

# Como baixar a API:

- clone o repo para seu hd com

```git clone https://github.com/Omniabsent/ConvisoAPI.git```

- entre na pasta com 

```cd ConvisoAPI```

- rode o comando abaixo:

```docker-compose up```

Possíveis erros nessa etapa:

No caso de "ActiveRecord::NoDatabaseError", rode:

```docker-compose run web rake db:create```

E no caso de "ActiveRecord::PendingMigrationError", rode:

```docker-compose run web rake db:migrate```

- Acesse http://localhost:3000/ e confirme se há o logo do Rails e nenhum erro. Nesse caso você está pronto pra começar a:

# Usar a API pelo Postman

- Função de criar conta

Vamos começar criando um usuário. Selecione uma requisição POST para localhost:3000/sign_up e na aba Body envie os valores desejados. Nesse exemplo vamos selecionar "form-data" e usar os seguintes:
```
key      | value
name     | John
email    | john@teste.com
password | 123456
```

Ao clicar em Send, você receberá um token. Tudo bem se você esquecer de pegar ele agora, você ainda pode acessar ele de novo usando a:

- Função de login 

Dessa vez faremos um POST para localhost:3000/login, com as credenciais que acabamos de cadastrar:
```
key      | value
name     | John
password | 123456
```
Novamente você receberá seu token. Segure ele, vamos precisar daqui a pouco, assim que formos...

- Criar uma vulnerabilidade

Dessa vez vamos enviar um POST para localhost:3000/vulnerabilities. Agora você precisa provar que você é você, então além dos dados a serem enviados no body, você também deve enviar o token pela aba Authorization, selecionando "Bearer Token" em Type e colando ele no campo do lado.

```
key                          | value
vulnerability[name]          | SQL Injection
vulnerability[description]   | ' or 1=1; -- 
vulnerability[impact_level]  | high
vulnerability[solution]      | Sanitize your db inputs
vulnerability[status]        | identified
```

Crie mais algumas vulnerabilidades à seu gosto. Existem três opções de impact_level: low, medium, e high, e três opções de status que você pode inserir: identified, being_analyzed, e fixed. Existe ainda um quarto status, gerado apenas em circunstâncias especiais, que veremos mais abaixo. 

- Visualizar lista de vulnerabilidades

Agora que já temos algumas vulnerabilidades cadastradas, podemos recuperar a lista com todos os dados delas, enviando uma requisição GET para localhost:3000/vulnerabilities. Não se esqueça de incluir seu token de autenticação junto com a requisição. Mas além de ver a lista completa, também podemos ver uma vulnerabilidade específica, colocando /:id no final da URI. Tente localhost:3000/vulnerabilities/1 pra visualizar a primeira vulnerabilidade que cadastramos. 

- Deletando uma vulnerabilidade

Agora que temos o caminho de uma vulnerabilidade específica, como localhost:3000/vulnerabilities/1, também podemos excluí-la. Basta enviar uma requisição http pra esse mesmo caminho, só substituindo GET por DELETE. Uma mensagem aparecerá dizendo que a vulnerabilidade foi excluída e que um log de exclusão foi gerado no histórico. Vamos dar uma olhada no que ele pode fazer:

- Visualizando histórico de alterações

Enviando um GET para localhost:3000/change_histories, você pode ver a lista de todas as vezes que alguém criou ou excluiu uma vulnerabilidade. Mas alguns IDs não nos dizem muito por si só. É por isso que também podemos encontrar mais detalhes sobre cada uma dessas alterações, dando um GET com o id do registro, assim como fizemos com o id da vulnerabilidade acima

- Visualizando detalhes de alteração

Dando um GET em localhost:3000/change_histories/1, podemos ver o nome de qual foi a primeira vulnerabilidade criada no sistema, e também o nome do usuário que criou ela. Avançando o número da id, podemos ver os detalhes de quando e por quem cada alteração foi feita na tabela Vulnerabilities. E isso inclui até mesmo vulnerabilidades que já foram deletadas. Procure com um GET em localhost:3000/change_histories alguma que tenha o quarto status, "deleted", e coloque o id dela no final da URI para descobrir qual nome a vulnerabilidade tinha antes de ser deletada e quem foi o responsável pela deleção.

# Epílogo

Obrigada por ter chegado até aqui! Existem muitas melhorias a serem feitas e novas funções a serem implementadas, como a opção de dar update no status de vulnerabilidades existentes, por exemplo. Essa foi a primeira vez que fiz uma API e aprendi muito no processo, mas esse é só o começo. 
