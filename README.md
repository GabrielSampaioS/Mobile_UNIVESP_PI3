# Dialysis Daily Tracker

Aplicativo mobile desenvolvido em Flutter para registro diário de
informações clínicas de pacientes em tratamento de diálise peritoneal.

O objetivo do projeto é permitir o controle estruturado e seguro de
dados clínicos, organizando as informações de forma clara para
acompanhamento e análise médica.

------------------------------------------------------------------------

# Objetivo do Projeto

Este projeto foi desenvolvido como parte de um trabalho acadêmico
(UNIVESP -- PI3), com foco em:

-   Desenvolvimento de aplicação mobile com banco de dados
-   Integração com API
-   Estrutura arquitetural organizada
-   Aplicação de boas práticas de desenvolvimento
-   Uso de princípios de engenharia de software

------------------------------------------------------------------------

# Funcionalidades

A aplicação foi estruturada para permitir a criação de formulários de
maneira modular e escalável.

Cada campo do formulário é um componente isolado, com sua própria
responsabilidade e validação. Essa abordagem permite:

-   Reutilização de componentes
-   Facilidade de manutenção
-   Atualização de campos sem impactar outros
-   Eliminação de validações duplicadas
-   Organização clara da camada de apresentação

Essa estrutura facilita a evolução do sistema conforme novas
necessidades clínicas forem surgindo.

------------------------------------------------------------------------

# Arquitetura do Projeto

O projeto segue uma organização baseada em separação de
responsabilidades, inspirada em:

-   Clean Architecture
-   DDD (Domain-Driven Design)
-   Princípios SOLID

Estrutura inicial do projeto (podendo evoluir conforme novas
funcionalidades forem adicionadas):

    lib/
     └── features/
          └── dialysis/
               ├── presentation/
               │     ├── pages/
               │     └── widgets/
               │           └── fields/
               │
               ├── domain/
               │     ├── entities/
               │     ├── repositories/
               │     └── usecases/
               │
               └── data/
                     ├── models/
                     ├── datasources/
                     └── repositories/

------------------------------------------------------------------------

# Conceitos Teóricos Aplicados no Projeto

## Diferença entre Domain e Mode
### Model (Camada de Dados)

Representa o formato de dados externo.

Responsabilidades:

-   Conversão de JSON
-   Comunicação com API
-   Persistência no banco de dados
-   Mapeamento de dados

O Model pode mudar caso a API ou o banco de dados sejam alterados.

------------------------------------------------------------------------

### Domain (Camada de Negócio)

Representa a regra de negócio pura da aplicação.

Responsabilidades:

-   Entidades do sistema
-   Regras de validação de negócio
-   Comportamentos do domínio

O Domain só deve mudar se houver alteração nas regras de negócio.

Essa separação reduz acoplamento e aumenta a previsibilidade do sistema.

------------------------------------------------------------------------

# Fluxo de Dados

Fluxo principal:

UI → UseCase → Repository → DataSource → API/Database

Fluxo de retorno:

API → Model → Mapper → Domain → UI

Essa organização mantém a camada de apresentação desacoplada da
infraestrutura.

------------------------------------------------------------------------

# Aplicação dos Princípios SOLID

## S --- Single Responsibility Principle

Cada classe possui apenas uma responsabilidade bem definida.

## O --- Open/Closed Principle

Novos campos ou regras podem ser adicionados sem modificar código já
existente.

## L --- Liskov Substitution Principle

Implementações de repositórios podem ser substituídas por mocks ou
outras fontes de dados sem quebrar o sistema.

## I --- Interface Segregation Principle

Interfaces são específicas para cada responsabilidade, evitando
dependências desnecessárias.

## D --- Dependency Inversion Principle

A camada de domínio não depende de frameworks, banco de dados ou
detalhes de infraestrutura.

------------------------------------------------------------------------

# Uso de DDD (Domain-Driven Design)

O projeto aplica conceitos como:

-   Entidades
-   Value Objects
-   Repositórios
-   Casos de uso

O foco principal é manter o domínio isolado da camada de infraestrutura,
garantindo maior clareza e organização das regras de negócio.

------------------------------------------------------------------------

# Camada de Presentation

Responsável por:

-   Telas
-   Formulários
-   Componentes reutilizáveis
-   Validação de entrada

Cada campo do formulário é um widget isolado, promovendo:

-   Reutilização
-   Organização
-   Testabilidade
-   Facilidade de manutenção

------------------------------------------------------------------------

# Persistência

A aplicação foi estruturada seguindo princípios SOLID, evitando
acoplamento direto com banco de dados.

Atualmente, para o projeto acadêmico, está sendo utilizado MongoDB.

Entretanto, a arquitetura permite substituir facilmente a fonte de dados
por:

-   SQLite
-   Hive
-   Firebase
-   API REST própria

A troca da infraestrutura não impacta a camada de domínio.

------------------------------------------------------------------------

# Tecnologias Utilizadas

-   Flutter
-   Dart
-   Clean Architecture
-   DDD
-   SOLID
-   MongoDB

------------------------------------------------------------------------

# Evoluções Futuras

-   Dashboard com gráficos
-   Histórico filtrável por data
-   Exportação de relatórios
-   Integração hospitalar
-   Autenticação de usuários
-   Armazenamento em nuvem

------------------------------------------------------------------------

# Autor

Gabriel Sampaio\
Projeto acadêmico -- UNIVESP PI3
