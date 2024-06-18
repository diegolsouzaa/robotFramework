*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    FakerLibrary


*** Variables ***
${PALAVRA_ALEATORIA}
${DOMINIO}    @testerobot.com

*** Keywords ***

Gerar um email aleatório com nome "${NOME}" e sobrenome "${SOBRENOME}" 
    ${PALAVRA_ALEATORIA}=    FakerLibrary.Word
    ${EMAIL}    Set Variable    ${NOME}${SOBRENOME}${PALAVRA_ALEATORIA}${DOMINIO}

    Log To Console    ${EMAIL}