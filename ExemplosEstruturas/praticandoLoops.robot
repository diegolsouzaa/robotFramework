*** Settings ***

*** Variables ***
@{NUMEROS}    1    3    5    7    9    10

*** Test Cases ***
Teste numero cinco e dez
    Imprimir numero cinco e dez


*** Keywords ***

Imprimir numero cinco e dez
    FOR    ${index}    ${NUMERO}    IN ENUMERATE    @{NUMEROS}
        IF    ${NUMERO}==5
            Log To Console    ${NUMERO} " - Eu sou o numero cinco"
        ELSE IF    ${NUMERO}==10
            Log To Console    ${NUMERO} "- Eu sou o numero dez"
        ELSE
           Log To Console    ${NUMERO} "- Eu não sou o numero cinco nem dez" 
        END        
    END