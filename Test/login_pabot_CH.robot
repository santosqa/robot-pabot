*** Settings ***
 ### Aqui informo o caminho do arquivo da Implementação.
  ## Na execução do CMDER vou informar esse arquivo de teste,
   # Ele irá pegar esse caminho do resource para executar a implementação que foi efetuada.
Resource         ../Resource/resource_pabot.robot
Test Teardown    Fechar navegador


*** Test case ***
 ## Aqui descreve os caso de teste. pode ser procedural, Gherkin/BDD, história ou checklist ###
   
## [Tags]   login ##############################################################
IN01: login Usuário Inválido
   [Tags]   login
    Usuário inválido, senha válida no chrome
    Valida mensagem Erro Usuário Inválido


IN02: login Senha Inválida
   [Tags]   login
    Usuário válido, senha inválida no chrome
    Valida mensagem Senha Inválida


IN03: login Caracteres especiais
   [Tags]   login
    Usuário caracteres Especiais, senha caracteres Especiais no chrome
    Valida mensagem Erro de login
   

IN04: login não preenchido
   [Tags]   login
    Não informar Usuário e não informar senha no chrome
    Valida alerta de campo obrigatório
 

IN05: login efetuado com sucesso
   [Tags]   login
    Usuário válido, senha válida no chrome
    Valida tela inicial Dashboard


IN06: login efetuado com sucesso 2
   [Tags]   login
    Usuário válido, senha válida 2 no chrome
    Valida tela inicial Dashboard 2
