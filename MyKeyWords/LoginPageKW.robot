***Settings***
Resource        ../Componentes/PageLogin.robot
Resource        ../Componentes/PageHome.robot
Library         SeleniumLibrary

***Keywords***
Dado que eu acesso o sistema
    Open Browser        http://localhost:3000/#/sign_in?last_page=/     Chrome

Quando eu insiro o usuario e a senha
    Input text      id:normal_login_username       testuser
    Input text      id:normal_login_password       pl123
    Submit form

Então o login feito com sucesso
    Element Should Be Visible       class:welcome

Fechar Navegador
    Close Browser