***Settings***
Resource        ../MyKeyWords/LoginPageKW.robot

Test Teardown   Fechar Navegador

***Test Cases***
Login Com Sucesso
    Dado que eu acesso o sistema
    Quando eu insiro o usuario e a senha
    Então o login feito com sucesso