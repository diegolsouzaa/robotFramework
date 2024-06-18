*** Settings ***

Resource    ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***
Cenario 1: Cadastrar um novo usuario com sucesso no ServeRest
    Criar usuario novo
    Cadastrar o usuario criado na ServeRest    email=${email_teste}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

Cenario 2: Cadastrar um usuario já existente
    Criar usuario novo
    Cadastrar o usuario criado na ServeRest    email=${email_teste}    status_code_desejado=201
    Repetir o cadastro do usuario
    Verificar se a API não permitiu o cadastro repetido

Cenário 3: Consultar os dados de um novo usuario
    Criar usuario novo
    Cadastrar o usuario criado na ServeRest    email=${email_teste}    status_code_desejado=201
    Consultar os dados do novo usuario
    Conferir os dados retornados
