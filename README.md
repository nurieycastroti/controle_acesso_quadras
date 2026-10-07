# Controle de acesso às quadras esportivas

Primeiro projeto de programação, desenvolvido para praticar banco de dados, Python e JavaScript.

A ideia surgiu observando ERPs do segmento que citarei e da necessidade de organizar informações sobre alunos e acesso
às quadras.

## Objetivo

Construir uma aplicação para cadastrar alunos, gerenciar permissões e registrar tentativas de acesso às quadras.

## Funcionalidades planejadas

- Cadastrar, editar e inativar alunos.
- Cadastrar quadras.
- Registrar permissões de acesso com prazo de validade.
- Permitir ou negar acessos, informando o motivo.
- Consultar o histórico e gerar relatórios.

## Tecnologias previstas

- SQL e SQLite para armazenar e consultar os dados.
- Python e Flask para implementar as regras da aplicação.
- JavaScript para conectar a interface à aplicação.
- HTML e CSS para organizar as telas.

## Status

Em planejamento. As funcionalidades ainda não foram implementadas.

## Dados utilizados

O projeto utilizará apenas dados fictícios para demonstração.

## Problema observado

Na rotina administrativa de uma arena esportiva, é necessário consultar se um aluno tem permissão para entrar e verificar a ocupação das quadras.

Atualmente, duas consultas exigem atenção frequente:
- Qual professor está em qual quadra?
- Qual quadra está disponível para Day Use?

## Funcionamento observado

Neste projeto de estudo, a identificação na entrada do aluno será simulada pela seleção de um aluno fictício.

A permissão de entrada depende do cadastro, da situação do pagamento e do plano do aluno.

- Pessoas sem cadastro não podem entrar.
- Pagamentos vencidos bloqueiam o acesso, sem tolerância.
- Alunos em dia com plano de acesso livre podem entrar
  independentemente do horário da aula.
- Alunos em dia sem acesso livre podem entrar de 10 minutos
  antes até 1 hora depois do início da própria aula.

Exemplo: para uma aula às 18h, a janela de entrada vai das 17h50 às 19h, incluindo os dois limites.

Essa janela trata da entrada. Regras de saída e permanência ainda serão definidas mais à frente.

## Ocupação das quadras

O acesso pode ser a qualquer quadra, respeitando a disponibilidade.
Aulas, eventos e manutenção ocupam ou bloqueiam quadras. No Day Use, a quadra é escolhida na chegada.
O projeto deverá distinguir a permissão para entrar da disponibilidade de uma quadra para uso.
