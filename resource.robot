*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://www.amazon.com.br
${BROWSER}            chrome

*** Keywords ***
Acessar a página da Amazon
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Pesquisar por celulares
    # Aguarda o elemento existir e estar visível por até 15 segundos
    Wait Until Element Is Visible    id=twotabsearchtextbox    timeout=15s
    Input Text      id=twotabsearchtextbox    celulares
    Click Element   id=nav-search-submit-button

Validar o resultado
    Wait Until Page Contains    resultados para "celulares"

Fechar o navegador
    Close Browser