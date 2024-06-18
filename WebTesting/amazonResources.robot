*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=Chrome
    Maximize Browser Window
    

Fechar navegador
    Capture Page Screenshot   locator
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
    
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=field-keywords    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]

# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Entao um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//img[@data-image-index='1']
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Click Element    locator=//a[contains(@aria-label,'1 item no carrinho')]
    Element Should Contain    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]    expected=Console Xbox Series S

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//input[contains(@value,'Excluir')]
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    Element Should Contain    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]    expected=Seu carrinho de compras da Amazon está vazio.
    
Quando adicionar o produto "${PRODUTO}" no carrinho
    Input Text    locator=field-keywords    text=${PRODUTO}
    Click Element    locator=nav-search-submit-button
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]
    Click Element    locator=//img[@data-image-index='1']
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Então o produto "xbox series s" deve ser mostrado no carrinho
    Click Element    locator=//a[contains(@aria-label,'1 item no carrinho')]
    Element Should Contain    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]    expected=Console Xbox Series S

E existe o produto "${PRODUTO}" no carrinho
     Input Text    locator=field-keywords    text=${PRODUTO}
     Click Element    locator=nav-search-submit-button
     Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]
     Click Element    locator=//img[@data-image-index='1']
     Click Element    locator=//input[contains(@name,'submit.add-to-cart')]
     Click Element    locator=//a[contains(@aria-label,'1 item no carrinho')]
     Element Should Contain    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]    expected=Console Xbox Series S

Quando remover o produto "Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//input[contains(@value,'Excluir')]
    Click Element    locator=//input[contains(@value,'Excluir')]

Então o carrinho deve ficar vazio
     Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
     Element Should Contain    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]    expected=Seu carrinho de compras da Amazon está vazio.
    
