***Settings***
Library         SeleniumLibrary
Resource        LoginPageKW.robot

***Keywords***
Logar na pagina
    Dado que eu acesso o sistema
    Quando eu insiro o usuario e a senha

Dado que eu acesso a Page 1
    Click Element        href:#/page1

Quando eu clico na coluna Name
    Click Element        class:ant-table-column-sorters

Então a tabela deve conter "${DADOS_STRING}"
    ${DADOS_JSON}=      evaluate        json.loads(${DADOS_STRING})     json
    