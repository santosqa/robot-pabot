*** Settings ***
 ### Aqui informo o caminho do arquivo da Implementação.
  ## Na execução do CMDER vou informar esse arquivo de teste,
   # Ele irá pegar esse caminho do resource para executar a implementação que foi efetuada.
Resource         ../Resource/resource_pabot.robot
Test Teardown    Fechar navegador


*** Test case ***
 ## Aqui descreve os caso de teste. pode ser procedural, Gherkin/BDD, história ou checklist ###
  

## [Tags]  Lista  ############################################################
LIST01: Navegação Lista de exames
    [Tags]   Lista
    Efetuar Login no A.Lite com chrome
    Abrir lista de exames
   

