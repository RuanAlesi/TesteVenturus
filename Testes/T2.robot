***Settings***
Resource            ../MyKeyWords/LoginPageKW.robot

Suite Setup         Logar na pagina
Suite Teardown      Fechar Navegador

***Variables***
${REGISTROS_TABELA}=   {"1":{"name":"Byron Hansen","borrow":"328","repayment":"109"},"2":{"name":"Gabrielle Sanchez","borrow":"235","repayment":"55"}}

***Test Cases***
Validar Informações da tabela na página 1
    Dado que eu acesso a Page 1
    Quando eu clico na coluna Name
    Então a tabela deve conter ${REGISTROS_TABELA}

Validar Informações da tabela na página 2
    Dado que eu acesso a Page 1
    Quando a pagina 2 está selecionada
    Então deve haver uma tabela de 3 colunas: Name, Borrow e Repayment
    E, o registro <n> deve ser: <name>, <borrow> e <repayment>