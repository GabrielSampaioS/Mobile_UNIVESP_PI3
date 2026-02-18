
# Dialysis Daily Tracker

Aplicativo mobile desenvolvido em **Flutter** para registro diário de informações clínicas de pacientes em tratamento de **diálise peritoneal**.

O objetivo do projeto é permitir o controle estruturado e seguro de dados clínicos, organizando as informações de forma clara para acompanhamento e análise médica.

---

## Objetivo do Projeto

Este projeto foi desenvolvido como parte de um trabalho acadêmico (**UNIVESP -- PI3**), com foco em:

- Desenvolvimento de aplicação mobile com banco de dados
- Integração com API
- Estrutura arquitetural organizada
- Aplicação de boas práticas de desenvolvimento
- Uso de princípios de engenharia de software

---

## Funcionalidades

A aplicação permite registrar informações diárias do tratamento, incluindo:

- Horário de início e fim
- Peso do paciente
- Ciclos
- Ultrafiltração
- Volume de urina (24h)
- Drenagem inicial
- Aspecto drenado
- Concentração da bolsa

Os campos do formulário são modularizados em widgets separados, garantindo:

- Reutilização de componentes
- Facilidade de manutenção
- Validação isolada por campo
- Organização clara da camada de apresentação

---

## Arquitetura do Projeto

O projeto segue separação de responsabilidades inspirado em:

- Clean Architecture
- DDD (Domain-Driven Design)
- SOLID

### Estrutura atual do projeto

```bash
lib/
│   main.dart
│
├── app/
│   ├── app.dart
│   ├── config/
│   │   ├── app_colors.dart
│   │   ├── routes.dart
│   │   └── theme_manager.dart
│   └── model/
│       └── dialysis_record.dart
│
├── core/
│   ├── formatters/
│   │   └── time_input_formatter.dart
│   └── widgets/
│       └── fields/
│           ├── bag_concentration_field.dart
│           ├── cycles_field.dart
│           ├── drain_aspect_field.dart
│           ├── end_time_field.dart
│           ├── initial_drainage_field.dart
│           ├── start_time_field.dart
│           ├── ultrafiltration_field.dart
│           ├── urine_volume_field.dart
│           └── weight_field.dart
│
├── features/
│   └── dialysis/
│       ├── application/
│       │   └── dialysis_controller.dart
│       │
│       ├── domain/
│       │   ├── dialysis_repository.dart
│       │   ├── entities/
│       │   │   └── dialysis_record.dart
│       │   ├── usecases/
│       │   │   ├── get_all_dialysis_record.dart
│       │   │   └── save_dialysis_record.dart
│       │   └── value_objects/
│       │       ├── cycles.dart
│       │       ├── dialysis_time.dart
│       │       ├── glucose_concentration.dart
│       │       ├── ultrafiltration.dart
│       │       ├── urine_volume.dart
│       │       └── weight.dart
│       │
│       └── infrastructure/
│           └── dialysis_repository_fake.dart
│
└── presentation/
    └── screens/
        ├── dialysis_list.dart
        ├── home_page.dart
        └── register_dialysis_page.dart
```

---

## Domain vs Model

### Model (Camada de Dados)

Representa o formato de dados externo ou de persistência.

Responsabilidades:

- Conversão de dados
- Mapeamento para banco/API
- Persistência
- Transporte de informações

---

### Domain (Camada de Negócio)

Representa a regra de negócio pura da aplicação.

Responsabilidades:

- Entidades
- Value Objects
- Validações de domínio
- Comportamentos do sistema

O Domain só deve mudar caso existam mudanças nas regras de negócio.

---

## Fluxo de Dados

Fluxo principal:

```
UI → Controller → UseCase → Repository → Infrastructure
```

Esse fluxo mantém a aplicação desacoplada e facilita a substituição da camada de persistência.

---

## Persistência e Infraestrutura

A arquitetura foi projetada seguindo princípios de desacoplamento, permitindo que a camada de infraestrutura possa ser substituída sem impacto na camada de domínio.

Isso significa que a aplicação pode evoluir para utilizar outras fontes de dados, como:

- SQLite
- Hive
- Firebase
- API REST própria

A substituição da infraestrutura não exige alterações nas regras de negócio, pois o domínio depende apenas de **interfaces (repositórios)** e não de implementações concretas.

Essa abordagem garante flexibilidade, escalabilidade e facilidade de manutenção.

---

## Uso de DDD (Domain-Driven Design)

O projeto aplica conceitos fundamentais de **Domain-Driven Design (DDD)**, mantendo o foco na modelagem clara do domínio da aplicação.

Os principais elementos aplicados são:

- **Entidades** — Representam objetos com identidade própria no sistema (ex: DialysisRecord).
- **Value Objects** — Representam conceitos imutáveis com regras específicas (ex: Weight, Cycles, DialysisTime).
- **Repositórios** — Interfaces que abstraem o acesso aos dados.
- **Casos de Uso (UseCases)** — Representam ações específicas do sistema (ex: salvar registro, listar registros).

O objetivo é manter o **domínio isolado da infraestrutura**, garantindo que:

- Regras de negócio não dependam de banco de dados ou frameworks.
- Mudanças tecnológicas não afetem a lógica central da aplicação.
- O código permaneça organizado, previsível e escalável.

Essa separação aumenta a clareza do sistema e reduz acoplamentos desnecessários.

---

## Tecnologias Utilizadas

- Flutter
- Dart
- GoRouter
- Provider
- Clean Architecture
- DDD
- SOLID

---

## Evoluções Futuras

O projeto foi estruturado para permitir crescimento contínuo. Entre as evoluções planejadas estão:

- Dashboard com gráficos para análise visual dos dados
- Histórico filtrável por período
- Exportação de relatórios (PDF/CSV)
- Autenticação e controle de usuários
- Armazenamento em nuvem

A arquitetura atual permite que essas funcionalidades sejam adicionadas sem comprometer a estrutura existente.

---

## Autor

Gabriel Sampaio  
