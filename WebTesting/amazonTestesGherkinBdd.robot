*** Settings ***
Documentation    Essa suite teste o site da amazon.com.br
Resource    amazonResources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste 01 - Acesso ao menu Eletrônicos
    [Documentation]  Esse teste verifica o menu Eletrônicos do site da amazon.com.br
    ...              e verificaa categoria Computadores e Informática
    [Tags]  menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página



Caso de teste 02 - Pesquisa de Produto
    [Documentation]  Esse teste verificar a busca de um produto
    [Tags]  buscaProdutos  listaBusca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Entao um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
     [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
     [Tags]             adicionar_carrinho
     Dado que estou na home page da Amazon.com.br
     Quando adicionar o produto "xbox series s" no carrinho
     Então o produto "xbox series s" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Xbox Series S" no carrinho
    Quando remover o produto "Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio

