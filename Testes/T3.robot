***Settings***
Resource            ../MyKeyWords/Page2KW.robot
Resource            ../MyKeyWords/Page1KW.robot

Suite Setup         Logar na pagina
Suite Teardown      Fechar Navegador

***Test Cases***
Validar campo Input
    [Tags]      input
    Dado que eu acesso a Page 2
    Quando eu insiro um texto no campo 'Input'      Meu texto
    E, saio do campo
    Então, o texto deve permanecer      Meu texto

Validar campo Select
    [Tags]      select
    Dado que eu acesso a Page 2
    Quando eu seleciono um país no campo 'Select'
    Então, o país selecionado deve ficar visível
    E, o mesmo nome deve ser atribuído na propriedade 'title'

Validar campo TreeSelect
    [Tags]      TreeSelect
    Dado que eu acesso a Page 2
    Quando eu seleciono a cor 'Red' no campo TreeSelect
    Então, a cor 'Red' deve ser ficar visível

Validar campo TreeSelect sem nenhuma cor
    [Tags]      TreeSelect2
    Dado que eu acesso a Page 2
    Quando eu seleciono o item 'Color' no campo TreeSelect
    Então, nenhuma cor deve ser ficar visível

Validar campo Cascader
    [Tags]      Cascader
    ${Estado}           Set Variable    São Paulo
    ${Cidade}           Set Variable    Campinas
    ${StrEndereco}      Set Variable    ${Estado} / ${Cidade}
    Dado que eu acesso a Page 2
    Quando eu seleciono o Estado ${Estado} e a cidade ${Cidade} no campo 'Cascader'
    Então, o campo deve conter ${StrEndereco}

Validar calendário no campo DatePicker
    [Tags]      DatePicker
    Dado que eu acesso a Page 2
    Quando eu clico sobre o campo DatePicker
    Então o calendário deve ser visível

Validar data no campo DatePicker
    [Tags]      DatePicker2
    ${Data}     Set Variable        2019-09-10
    Dado que eu acesso a Page 2
    Quando eu clico sobre o campo DatePicker
    E, informo a data ${Data} no formato yyyy-mm-dd
    Então a data ${Data} deve ser visível

Validar campo Slider
    [Tags]      Slider
    ${input}    Set Variable    5
    ${fracao}   Set Variable    5.2632
    Convert to Number       ${input}  
    Convert to Number       ${fracao}  
    ${progresso_slider}=    Evaluate        (${input}-1)*${fracao}
    Convert to String       ${progresso_slider}
    Convert to String       ${input}
    Dado que eu acesso a Page 2
    Quando eu informo o input (de 1 a 20) com o valor de ${input}
    Então o slider deve progredir na fração de aproximadamente 5,26%, portanto ${progresso_slider}%

Validar campo Switch
    [Tags]      Switch
    Dado que eu acesso a Page 2
    Quando eu clico no botão switch
    Então, no primeiro clique o botão deve ativar
    E, num segundo clique desativar

Validar campo TextArea
    [Tags]      TextArea
    ${texto}    Set Variable    Meu texto
    Dado que eu acesso a Page 2
    Quando eu digito um ${texto} no campo 'TextArea'
    Então o ${texto} digitado deve estar inserido