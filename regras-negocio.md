# Regras de negócio

Este documento define o comportamento esperado da primeira
versão do projeto. Todos os dados utilizados serão fictícios.

## 1. Identificação

Neste projeto, a identificação do aluno será feita pela seleção de um aluno fictício cadastrado. Não será considerado, neste projeto,
nenhum outro tipo de identificação, como reconhecimento facial, biometria, reconhecimento por voz, senha ou cartão magnético. 

## 2. Permissão de entrada

- Pessoas sem cadastro terão o acesso negado.
- Alunos com pagamento vencido terão o acesso negado, inclusive quando possuírem plano de acesso livre.
- O bloqueio por inadimplência não terá prazo de tolerância: mediante ausência do pagamento, o acesso será bloqueado instantaneamente.
- Alunos com pagamento em dia e plano de acesso livre poderão entrar independentemente do horário da aula.
- Alunos com pagamento em dia e sem plano de acesso livre dependerão do horário de uma aula em que estejam matriculados.

## 3. Janela de entrada para alunos sem acesso livre

A entrada será permitida de 10 minutos antes até 1 hora depois do início da aula, incluindo os dois limites.

Exemplo: para uma aula às 18h, a entrada será permitida das 17h50 às 19h.

Essa regra define somente o horário de entrada. Não define o horário de saída ou o tempo de permanência.

## 4. Disponibilidade das quadras

A permissão de entrada não garante uma quadra disponível.

Os alunos poderão utilizar qualquer quadra disponível, respeitando as regras do estabelecimento.

Aulas, eventos e manutenção tornarão uma quadra indisponível durante seus respectivos períodos.

No Day Use, a quadra será escolhida na chegada.

Para a demonstração, o início e o fim do uso por Day Use serão registrados manualmente. Enquanto esse uso estiver em andamento, 
a quadra será apresentada como ocupada.

## 5. Consultas previstas

O sistema criado deverá permitir consultar:

- Qual professor está em qual quadra em determinado horário.
- Quais quadras estão disponíveis para Day Use.
- O histórico de tentativas de entrada, com resultado e motivo.

## 6. Cenários de validação do acesso

Nos exemplos abaixo, a aula começa às 18h. Exceto quando indicado, o aluno está cadastrado, com pagamento em dia e sem plano de acesso livre.

| Cenário | Resultado esperado |
|---|---|
| Pessoa sem cadastro | Negado: ausência de cadastro |
| Aluno inadimplente com plano livre | Negado: pagamento vencido |
| Entrada às 17h49 | Negado: fora da janela |
| Entrada às 17h50 | Permitido |
| Entrada às 18h30 | Permitido |
| Entrada às 19h | Permitido |
| Entrada às 19h01 | Negado: fora da janela |
| Aluno em dia com plano livre, fora do horário da aula | Permitido |
| Aluno em dia sem plano livre e sem aula naquele dia | Negado: ausência de aula que autorize a entrada |

## 7. Cenários de disponibilidade

| Situação no horário consultado | Resultado esperado |
|---|---|
| Quadra com aula | Indisponível; informar professor |
| Quadra com evento | Indisponível |
| Quadra em manutenção | Indisponível |
| Quadra com Day Use em andamento | Indisponível |
| Quadra sem ocupação ou bloqueio | Disponível |

## 8. Limites da primeira versão

O projeto terá cadastro de alunos, situação de pagamento, planos, professores, aulas, ocupações de quadras e
registros de acesso.

A situação de pagamento será informada manualmente. O sistema não realizará cobranças nem processará pagamentos.

Também ficarão fora desta primeira versão versão:

- Reservas antecipadas de quadras.
- Controle automático de saída ou permanência.

## 9. Detalhes ainda a definir

- Como representar a situação de pagamento nos dados.
- Como tratar o instante de término das ocupações das quadras.
- Como impedir registros de ocupação com horários conflitantes.
