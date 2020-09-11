***Settings***
Library     SeleniumLibrary
Resource    Page1KW.robot
Library     String

***Keywords***
Dado que eu acesso a Page 2
    Click Element        xpath://*[@id="root"]/div/header/div[2]/nav/a[2]

Quando eu insiro um texto no campo 'Input'
    [Arguments]     ${TEXTO}
    Input text      xpath://*[@id="root"]/div/main/div/form/div[2]/div[2]/div/span/span/input       ${TEXTO}

E, saio do campo
    Click Element        xpath://*[@id="root"]/div/main/div/form/div[2]/div[1]/label

Então, o texto deve permanecer
    [Arguments]     ${TEXTO}
    ${texto_contido}=       Get Element Attribute       xpath://*[@id="root"]/div/main/div/form/div[2]/div[2]/div/span/span/input       value
    Should Be Equal         ${TEXTO}        ${texto_contido}

Quando eu seleciono um país no campo 'Select'
    Click Element       xpath://*[@id="root"]/div/main/div/form/div[3]/div[2]/div/span/div/div/div/div[1]
    Input text          xpath://*[@id="root"]/div/main/div/form/div[3]/div[2]/div/span/div/div/div      Brazil
    

Então, o país selecionado deve ficar visível
    ${texto_contido}=       Get Value               xpath://*[@id="root"]/div/main/div/form/div[3]/div[2]/div/span/div/div/div/div[2]
    Should Be Equal         ${texto_contido}        Brazil
    

E, o mesmo nome deve ser atribuído na propriedade 'title'
    ${texto_contido}=       Get Element Attribute   xpath://*[@id="root"]/div/main/div/form/div[3]/div[2]/div/span/div/div/div/div[2]   title

Quando eu seleciono a cor 'Red' no campo TreeSelect
    Click Element       xpath://*[@id="root"]/div/main/div/form/div[4]/div[2]/div/span/span/span/span[1]
    Click Element       xpath://*[@id="rc-tree-select-list_1"]/ul/li/span[1]
    Click Element       xpath://*[@id="rc-tree-select-list_1"]/ul/li/ul/li[1]/span[2]

Então, a cor 'Red' deve ser ficar visível
    ${texto_contido}        Get Element Attribute       xpath://*[@id="root"]/div/main/div/form/div[4]/div[2]/div/span/span/span/span[1]/span       title
    Should Be Equal         ${texto_contido}        Red

    
Quando eu seleciono o item 'Color' no campo TreeSelect
    Reload Page
    Click Element       xpath://*[@id="root"]/div/main/div/form/div[4]/div[2]/div/span/span/span/span[1]
    Click Element       id:rc-tree-select-list_1

Então, nenhuma cor deve ser ficar visível
    ${texto_contido}        Get Text               xpath://*[@id="root"]/div/main/div/form/div[4]/div[2]/div/span/span/span/span[1]/span
    Should Be Equal         ${texto_contido}       Color

Quando eu seleciono o Estado ${Estado} e a cidade ${Cidade} no campo 'Cascader'
    Click Element       xpath://*[@id="root"]/div/main/div/form/div[5]/div[2]/div/span/span/input
    Click Element       xpath://*[@title="São Paulo"]
    Click Element       xpath://*[@title="Campinas"]    

Então, o campo deve conter ${StrEndereco}
    ${texto_contido}    Get Text            class:ant-cascader-picker-label 
    Should Be Equal     ${StrEndereco}      ${texto_contido}

Quando eu clico sobre o campo DatePicker
    Click Element       class:ant-calendar-picker-input.ant-input
    Sleep               2s

Então o calendário deve ser visível
    Element Should Be Visible       class:ant-calendar-picker-container.ant-calendar-picker-container-placement-bottomLeft

E, informo a data ${data} no formato yyyy-mm-dd
    Execute Javascript      document.getElementsByClassName('ant-calendar-input ')[0].setAttribute('value', '${data}')
    Press Keys              class:ant-calendar-picker-input.ant-input       RETURN
    Sleep   2s

Então a data ${data} deve ser visível
    Element Attribute Value Should Be       class:ant-calendar-picker-input.ant-input     value     ${data}  

Quando eu informo o input (de 1 a 20) com o valor de ${input}
    #Execute Javascript      document.getElementsByClassName('ant-input-number-input')[0].setAttribute('value', '${input}')
    Press Keys          class:ant-input-number-input        \ue003
    Sleep   2s
    Input text              class:ant-input-number-input       ${input} 
    Sleep   2s

Então o slider deve progredir na fração de aproximadamente 5,26%, portanto ${progresso_slider}%
    ${texto_contido}        Get Element Attribute       class:ant-slider-track      style
    ${width}                Remove String               ${texto_contido}        left: 0%; width:    %
    ${width}                Remove String       ${width}      ;
    Convert to number       ${width}
    Convert to number       ${progresso_slider}

    Should Be Equal As Numbers      ${width}        ${progresso_slider}     precision=3

Quando eu clico no botão switch
    Click Element           class:ant-switch

Então, no primeiro clique o botão deve ativar
    Element Attribute Value Should Be       class:ant-switch.ant-switch-checked.ant-switch-disabled     aria-checked    true

E, num segundo clique desativar
    Click Element                           class:ant-switch.ant-switch-checked.ant-switch-disabled
    Element Attribute Value Should Be       class:ant-switch            aria-checked        false

Quando eu digito um ${texto} no campo 'TextArea'
    Input text      class:ant-input.Page2_TextArea__2xW5H       ${texto}

Então o ${texto} digitado deve estar inserido
    Textarea Should Contain     class:ant-input.Page2_TextArea__2xW5H       ${texto}