*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections


*** Variables ***

*** Keywords ***
Criar usuario novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Log    essa eh a palavra ${palavra_aleatoria}@teste.com
    Set Test Variable    ${email_teste}    ${palavra_aleatoria}@emailteste.com
    Log    ${email_teste}

Cadastrar o usuario criado na ServeRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    nome=Fulano da silva
    ...    email=${email_teste}
    ...    password=1234
    ...    administrador=true
    
    Criar Sessao na ServeRest
    ${resposta}    POST On Session
    ...            alias=ServerRest
    ...            url=/usuarios
    ...            json=${body}
    ...            expected_status=${status_code_desejado}
    Log    ${resposta.json()}
    IF    ${resposta.status_code} == 201
         Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}       
    END
   
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar Sessao na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServerRest    url=https://serverest.dev    headers=${headers}

Conferir se o usuario foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    _id

Repetir o cadastro do usuario
    Cadastrar o usuario criado na ServeRest    email=${email_teste}    status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuario
    ${resposta_consulta}    GET On Session    alias=ServerRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}

Conferir os dados retornados
    Log    ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome           Fulano da silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email          ${email_teste}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password       1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador  true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id            ${ID_USUARIO}  


    