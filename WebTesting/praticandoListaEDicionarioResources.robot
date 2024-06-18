*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections


*** Variables ***

@{MESES}    janeiro    fevereiro    marco    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro
&{JANEIRO}    nome=janeiro    dias=31
&{FEVEREIRO}    nome=fevereiro    dias=28
&{MARCO}    nome=marco    dias=31
&{ABRIL}    nome=abril   dias=30
&{MAIO}    nome=maio    dias=31  
&{JUNHO}    nome=junho    dias=30
&{JULHO}    nome=julho    dias=31   
&{AGOSTO}    nome=agosto    dias=31    
&{SETEMBRO}    nome=setembro    dias=30 
&{OUTUBRO}    nome=outubro    dias=31    
&{NOVEMBRO}    nome=novembro    dias=30
&{DEZEMBRO}    nome=dezembro    dias=31    



*** Keywords ***
Deve listar os meses dos ano
    Log to Console    ${MESES[0]}
    Log to Console    ${MESES[1]}
    Log to Console    ${MESES[2]}
    Log to Console    ${MESES[3]}
    Log to Console    ${MESES[4]}
    Log to Console    ${MESES[5]}
    Log to Console    ${MESES[6]}
    Log to Console    ${MESES[7]}
    Log to Console    ${MESES[8]}
    Log to Console    ${MESES[9]}
    Log to Console    ${MESES[10]}
    Log to Console    ${MESES[11]}

Deve listar a quantidade de dias por mes
    Log To Console   o mes de ${JANEIRO.nome} tem ${JANEIRO.dias} dias
    Log To Console   o mes de ${FEVEREIRO.nome} tem ${FEVEREIRO.dias} dias
    Log To Console   o mes de ${MARCO.nome} tem ${MARCO.dias} dias
    Log To Console   o mes de ${ABRIL.nome} tem ${ABRIL.dias} dias
    Log To Console   o mes de ${MAIO.nome} tem ${MAIO.dias} dias
    Log To Console   o mes de ${JUNHO.nome} tem ${JUNHO.dias} dias
    Log To Console   o mes de ${JULHO.nome} tem ${JULHO.dias} dias
    Log To Console   o mes de ${AGOSTO.nome} tem ${AGOSTO.dias} dias
    Log To Console   o mes de ${SETEMBRO.nome} tem ${SETEMBRO.dias} dias
    Log To Console   o mes de ${OUTUBRO.nome} tem ${OUTUBRO.dias} dias
    Log To Console   o mes de ${NOVEMBRO.nome} tem ${NOVEMBRO.dias} dias
    Log To Console   o mes de ${DEZEMBRO.nome} tem ${DEZEMBRO.dias} dias