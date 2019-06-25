*** Settings ***
# Library utilizadas.
Library          SeleniumLibrary
Library          pabot.PabotLib

*** Variables ***
# Elementos inspecionados do site e implemtados no cenário de teste.

 #${Navegador}             gc
 ${url}                    http://192.168.102.203/#/login
 ${Campo_usuário}          id=formly_1_input_email_0
 ${Campo_senha}            id=formly_1_input_password_1
 ${Usuário_inválido}       Mester
 ${Senha_válida}           qaz123
 ${Usuário_válido}         rodrigo5.santos@wtt.com.br
 ${Senha_inválida}         111111
 ${Botão_entrar}           css=div > button
 ${caracteres_especiais}   '@$#%&
 ${Mensagem Erro de login}   css=div.ui-toast-detail
 ${Texto erro login}      Ocorreu um erro! Por favor tente novamente ou contate o suporte
 ${Alerta usuário Obrigatório}     css=formly-field:nth-child(1) > formly-wrapper-primeng-form-field > div.ui-message
 ${Texto usuário Obrigatório}    Usuário é obrigatório
 ${Alerta Senha Obrigatória}     css=formly-field:nth-child(2) > formly-wrapper-primeng-form-field > div.ui-message
 ${Texto Senha Obrigatória}     Senha é obrigatório
 ${Mensagem logoff}             css=div[class='ui-toast-detail']    
 ${Texto logoff}                Sessão finalizada com sucesso
 ${Botão Logoff}                css=i[class='fas fa-users-cog']
 ${Botão Sair Logoff}           xpath=//*[contains(text(), "Sair")]
 ${Bem Vindo}                   Bem vindo {{ user }}

*** Keywords ***
### Setup e Teardown
# Test Teardown  Close browser
# Abrir navegador
#    Open Browser   ${url}
#    Maximize Browser Window

Fechar navegador
  Close Browser


 ### Implementação Test case
 
## [Tags]   login #######################################################

#CT01: login Usuário Inválido
Usuário inválido, senha válida no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_inválido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Valida mensagem Erro Usuário Inválido
     Element text should be    ${Mensagem Erro de login}   ${Texto erro login}


#CT02: login Senha Inválida
Usuário válido, senha inválida no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_inválida}
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Valida mensagem Senha Inválida
     Element text should be    ${Mensagem Erro de login}   ${Texto erro login}


# CT03: login Caracteres especiais
Usuário caracteres Especiais, senha caracteres Especiais no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${caracteres_especiais}
     Input Text            ${Campo_senha}      ${caracteres_especiais}
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Valida mensagem Erro de login
     Element text should be    ${Mensagem Erro de login}   ${Texto erro login}
     

#CT04: login não preenchido
Não informar Usuário e não informar senha no ${browser} 
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Set Focus To Element    ${Campo_usuário}    
     Set Focus To Element    ${Campo_senha}  
     Set Focus To Element    ${Campo_usuário}    
     Sleep    02s
     Capture Page Screenshot
Valida alerta de campo obrigatório
     Element text should be    ${Alerta usuário Obrigatório}    ${Texto usuário Obrigatório}
     Element text should be    ${Alerta Senha Obrigatória}    ${Texto Senha Obrigatória}


#CT05: login efetuado com sucesso
Usuário válido, senha válida no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Capture Page Screenshot
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Valida tela inicial Dashboard
     Page Should Contain     ${Bem Vindo}


#CT06: login efetuado com sucesso 2
Usuário válido, senha válida 2 no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Capture Page Screenshot
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Valida tela inicial Dashboard 2
     Page Should Contain     ${Bem Vindo}


## [Tags]  Lista  ############################################################

#CT07: Navegação Lista de exames
Efetuar Login no A.Lite com ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Capture Page Screenshot
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Abrir lista de exames
     Click Element     css=i[class='fas fa-bars']
     Click Element     xpath=//*[contains(text(), "Diagnósticos")] 
     Sleep    02s
     Click Element     xpath=//*[contains(text(), "Exames")] 


#CT08: Navegação Configurações
Na página home ao logar no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Capture Page Screenshot
     Click Element         ${Botão_entrar}
     Sleep    02s
     Capture Page Screenshot
Abrir Configurações
     Sleep    02s
     Click Element     css=span[class='ui-menuitem-icon fas fa-cog ng-star-inserted']
     Capture Page Screenshot

## [Tags]   logoff #######################################################

#CT09 logoff Sessão finalizada com sucesso
Logoff finalizar sessão com sucesso no ${browser}
     open browser    ${url}   ${browser}
     Maximize Browser Window
     Sleep    02s
     Capture Page Screenshot
     Input Text            ${Campo_usuário}    ${Usuário_válido} 
     Input Text            ${Campo_senha}      ${Senha_válida}
     Capture Page Screenshot
     Click Element         ${Botão_entrar}
     Sleep    02s
     Click Element     ${Botão Logoff}
     Sleep    02s
     Capture Page Screenshot
     Click Element     ${Botão Sair Logoff}
     Sleep    02s
     Capture Page Screenshot
Validar mensagem logoff
     Element text should be    ${Mensagem logoff}   ${Texto logoff}
 
   
