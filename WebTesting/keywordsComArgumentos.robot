*** Settings ***
Resource    keywordsComArgumentosResource.robot

*** Test Cases ***

Cenario 1 - Deve montar um email
    [Tags]    email_aleatorio
    Gerar um email aleatório com nome "Pedro" e sobrenome "Nascimento"