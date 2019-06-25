*** Settings ***
 ### Aqui informo o caminho do arquivo da Implementação.
  ## Na execução do CMDER vou informar esse arquivo de teste,
   # Ele irá pegar esse caminho do resource para executar a implementação que foi efetuada.
Resource         ../Resource/resource_pabot.robot
Test Teardown    Fechar navegador


*** Test case ***
 ## Aqui descreve os caso de teste. pode ser procedural, Gherkin/BDD, história ou checklist ###
   

## [Tags]   Logoff ##############################################################
OFF09: logoff Sessão finalizada com sucesso
   [Tags]   logoff
    Logoff finalizar sessão com sucesso no chrome
    Validar mensagem logoff


