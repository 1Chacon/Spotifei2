Relatorio de Desenvolvimento do Projeto Spotifei

1.) Objetivo do Projeto

O projeto **Spotifei** tem como objetivo simular uma plataforma de gerenciamento de musicas e playlists,
com funcionalidades semelhantes as de um sistema de streaming musical.
Desenvolvido como um trabalho pratico de disciplina,
o projeto visa aplicar conceitos de programação orientada a objetos, arquitetura MVC,
manipulação de banco de dados com JDBC e interface grafica em Java com Swing.

---

2.) Funcionalidades Implementadas

O sistema desenvolvido possui as seguintes funcionalidades principais:

- **Cadastro e login de usuários**
- **Busca de musicas** por nome, artista ou genero
- **Criação, edição e exclusão de playlists**
- **Adicionamento e remoção de musicas de playlists**
- **Curtição de musicas**
- **Historico de buscas**
- **Visualização de musicas curtidas**

Cada uma dessas funcionalidades foi implementada em camadas separadas (Model, View e Controller) 
e com persistência no banco de dados PostgreSQL.

---

3.) Tecnologias Utilizadas

- **Linguagem:** Java 8+
- **Interface:** Java Swing
- **Persistência:** JDBC com PostgreSQL
- **IDE:** NetBeans
- **Controle de versão:** Git e GitHub

---

4.) Arquitetura e Estrutura de Pastas (MVC)

O projeto foi construido com base no padrão arquitetural **MVC (Model-View-Controller)**:


src/

├── controller/    # Controladores (lógica de negócio)

├── dao/           # Acesso a dados (JDBC)

├── model/         # Modelos de dados (entidades)

├── view/          # Interfaces Swing

└── Main.java      # Classe principal do sistema


Cada funcionalidade possui um conjunto de classes que se comunicam entre essas camadas, 
garantindo separação de funcionalidades.

---

5.) Processo de Desenvolvimento (Etapas)

O projeto foi construido de forma incremental, em etapas claras, com o uso de **commits separados na branch `main`** 
para organizar cada funcionalidade:

1. Estrutura do projeto
2. Funcionalidade de login/cadastro
3. CRUD de playlists
4. Busca de musicas
5. Curtir musicas
6. Historico de buscas
7. Adição e remoção de musicas das playlists

Cada etapa foi commitada separadamente e pode ser consultada no historico do repositório no GitHub, alem de etapas extras
feitas para colocar algum recurso faltante ou algum arquivo que nao foi colocado durante os commits.

---

6.) Como Executar o Sistema

- 1 Instale o Java e o PostgreSQL
- 2 Crie um banco de dados chamado `spotifei`
- 3 Importe o script `spotifei.sql` pelo pgAdmin:

   * Clique com o botão direito no banco > Query Tool
   * Abra o arquivo `spotifei.sql` e clique em **Executar**
- 4 Acesse a pasta `dist/` e verifique se estão presentes:

   * `Spotifei.jar`
   * `postgresql-42.7.2.jar`
    
- 5 
Execute o arquivo `Spotifei.jar`

ou

Abra no NetBeens

ou 

Execute o comando:

```bash
java -cp "Spotifei.jar;postgresql-42.7.2.jar" Main
```
---


7.) Javadoc

A documentação Javadoc está localizada na pasta:

```bash
dist/javadoc/index.html
```
---

8.) Considerações Finais

O projeto Spotifei foi concluido, aplicando boas praticas de programação orientada a objetos, padrão MVC,
acesso a banco de dados e interfaces graficas com Swing.
O GitHub foi utilizado como ferramenta central de organização e controle de versoes
, com commits separados na `main`, documentacao javadoc e .jar funcional prontos para entrega.
