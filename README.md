# BaixaAqui

Objetivo do projeto:

Protótipo responsável por realizar um download a partir de um link informado pelo usuário, sendo possível acompanhar o percentual do download, exibir progresso atual ou cancelar o download em andamento.  

Principais funcionalidades:

1	– “Iniciar Download” – Realiza um download após o usuário informar um link válido.
2	– “Exibir mensagem” – Exibe o progresso de um download em andamento ou informa que não há downloads em andamento.
3	– “Parar download” – Caso tenha algum download em andamento, confirma se o usuário deseja cancelar o download, se não houver, apenas informa que não há downloads sendo processados. 
4	– “Últimos downloads” – Abre um formulário com a lista dos últimos downloads que foram concluídos com sucesso, neste formulários é possível repetir um download ou fechar a tela.
5	– “Fechar” – Encerra a aplicação caso não houver download em andamento, se houver vai questionar o usuários se deseja cancelar o download em andamento.     

Histórico de downloads:
 
Há também uma funcionalidade onde é possível pesquisar os últimos downloads ordenados por data, sendo possível repetir um determinado download caso seja necessário. A alimentação das informações para gerar o histórico de downloads acontece no momento em que ao iniciar um download, o mesmo seja concluído sem nenhuma falha, dessa forma, o os downloads realizados ficam salvos em um banco de dados SQLite. 

Padrões aplicados no projeto:

MVC
Clean code
OOP + Interfaces
Fluent interface.

Tecnologias:

IDE: Delphi 10.3 Community Edition
Banco de dados: SQLite
