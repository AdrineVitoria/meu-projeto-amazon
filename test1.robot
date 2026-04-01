*** Settings ***
Library           SeleniumLibrary
Test Teardown    Fechar o navegador

*** Variables ***
${URL}            https://www.amazon.com.br
${BROWSER}        chrome
${CAMPO_PESQUISA}    id=twotabsearchtextbox
${BOTAO_PESQUISA}    id=nav-search-submit-button

*** Test Cases ***
Caso de teste: Pesquisar Produto na Amazon
    [Documentation]    Este teste acessa a Amazon e pequisa um produto variável>
    Acessar a página da Amazon
    Pesquisar por "iphone 15"

Caso de teste: Pesquisar Produto na Amazon
    Acessar a página da Amazon
    Pesquisar por "Playstation 5"
    Validar o resultado para "Playstation 5"

*** Keywords ***
Acessar a página da Amazon
    Open Browser   ${URL}    browser=${BROWSER}
    Maximize Browser Window

Pesquisar por "${PRODUTO}"
    # Aguarda o elemento estar pronto para evitar o erro de "not found"
    Wait Until Element Is Visible    ${CAMPO_PESQUISA}    timeout=15s
    Input Text      ${CAMPO_PESQUISA}    ${PRODUTO}
    Click Element   ${BOTAO_PESQUISA}

Validar o resultado para "${PRODUTO}"
    # Verifica se o texto da busca aparece nos resultados
    Wait Until Page Contains    resultados para "${PRODUTO}"
    Element Should Be Visible    xpath=//span[contains(.,'${PRODUTO}')]

Fechar o navegador
    Capture Page Screenshot
    Close Browser