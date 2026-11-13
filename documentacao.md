### 1.1 Requisitos Funcionais do Sistema


| ID | Requisito | Descrição |
| --- | --- | --- |
| RF01 | Autenticar acesso | Confere as credenciais informadas e comunica o usuário caso o login não seja aceito. |
| RF02 | Abrir painel inicial | Depois da autenticação, apresenta a página principal com as opções do sistema. |
| RF03 | Finalizar sessão | Remove o token de acesso; se isso não ocorrer, ele perde a validade automaticamente após uma hora. |
| RF04 | Inserir cliente | Permite registrar nome e CPF, exigindo os dois campos e impedindo CPF já cadastrado. |
| RF05 | Pesquisar cliente | Localiza um cliente usando seu nome ou número de CPF. |
| RF06 | Modificar cliente | Atualiza os dados do cliente selecionado a partir do seu identificador. |
| RF07 | Remover cliente | Apaga o cliente informado, desde que ele não possua veículos vinculados. |
| RF08 | Adicionar veículo | Cadastra um veículo com modelo e cliente obrigatórios, deixando a placa como informação opcional. |
| RF09 | Editar veículo | Altera modelo, placa ou cliente associado por meio do ID do veículo. |
| RF10 | Retirar veículo | Exclui o veículo escolhido, exceto quando houver agendamentos relacionados a ele. |
| RF11 | Marcar atendimento | Cria um agendamento com data e veículo definidos. |
| RF12 | Visualizar agendamentos | Exibe os registros ordenados pela data, incluindo informações do veículo e do cliente. |
| RF13 | Reprogramar atendimento | Permite trocar a data ou o veículo de um agendamento identificado. |
| RF14 | Cancelar agendamento | Exclui o agendamento selecionado somente depois da confirmação da ação. |


### 1.2 Requisitos Não Funcionais


| ID | Requisito | Descrição |
| --- | --- | --- |
| RNF01 | Segurança das informações | Os dados dos usuários e clientes devem ser protegidos contra acesso, alteração ou divulgação sem autorização. |
| RNF02 | Confiabilidade dos registros | O sistema deve preservar os dados cadastrados sem duplicações indevidas ou perdas durante as operações. |
| RNF03 | Permissões de utilização | Cada funcionalidade deve ser liberada somente para usuários autenticados e autorizados. |


## 2 Requisitos de Infraestrutura


| Tecnologia | Versão / ambiente |
| --- | --- |
| JavaScript | Node.js 24 |
| Next.js | 16 |
| React e React DOM | 19 |
| bcryptjs | 3 |
| jsonwebtoken | 9 |
| node:crypto | Integrado ao Node.js |
| PostgreSQL | 18 |
| Prisma e Prisma Client | 6 |
| Ant Design | 6 |