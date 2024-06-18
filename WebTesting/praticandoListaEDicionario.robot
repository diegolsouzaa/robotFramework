*** Settings ***
Documentation    exemplo de valores em lista
Resource    praticandoListaEDicionarioResources.robot



*** Test Cases ***

Caso de teste 1 - Lista - meses do ano
    [Tags]    lista_meses
    Deve listar os meses dos ano

Caso de teste 2 - Dicionario - quantidade de dias por meses
    [Tags]    dicionario_meses_e_dias
    Deve listar a quantidade de dias por mes
