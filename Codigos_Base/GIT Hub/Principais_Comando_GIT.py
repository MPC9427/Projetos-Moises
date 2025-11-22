# GIT --help #

   #git [-v | --version] [-h | --help] [-C <path>] [-c <name>=<value>]
   #        [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
   #        [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--no-lazy-fetch]
   #        [--no-optional-locks] [--no-advice] [--bare] [--git-dir=<path>]
   #        <command> [<args>]

#Git Comando e o que eles Fazem #


    #start a working area (see also: git help tutorial)
    #clone      Clone a repository into a new directory
    #init       Create an empty Git repository or reinitialize an existing one

    #work on the current change (see also: git help everyday)
    #add        Add file contents to the index
    #v         Move or rename a file, a directory, or a symlink
    #restore    Restore working tree files
    #rm         Remove files from the working tree and from the index

    #examine the history and state (see also: git help revisions)
    #bisect     Use binary search to find the commit that introduced a bug
    #diff       Show changes between commits, commit and working tree, etc
    #grep       Print lines matching a pattern
    #log        Show commit logs
    #show       Show various types of objects
    #status     Show the working tree status

    #grow, mark and tweak your common history
    #backfill   Download missing objects in a partial clone
    #branch     List, create, or delete branches
    #commit     Record changes to the repository
    #merge      Join two or more development histories together
    #rebase     Reapply commits on top of another base tip
    #reset      Reset current HEAD to the specified state
    #witch     Switch branches
    #tag        Create, list, delete or verify a tag object signed with GPG

    #collaborate (see also: git help workflows)
    #fetch      Download objects and refs from another repository
    #pull       Fetch from and integrate with another repository or a local branch
    #push       Update remote refs along with associated objects

    #'git help -a' and 'git help -g' list available subcommands and some
    #concept guides. See 'git help <command>' or 'git help <concept>'
    #to read about a specific subcommand or concept.
    #See 'git help git' for an overview of the system.


#Etapas para configurar o VSCode com GitHub#


#Instale o Git no seu computador
#Baixe e instale o Git em git-scm.com.
#Verifique se está instalado com o comando: git --version.
#Configure seu nome de usuário e e-mail


            #Abra o terminal ou prompt de comando.
                git config --global user.name "Seu Nome"
                git config --global user.email "seuemail@example.com"

#Crie um repositório no GitHub
#Vá até github.com, crie uma conta (se ainda não tiver) e crie um novo repositório.
#Clone o repositório no VSCode

            #No terminal do VSCode, digite:
                git clone https://github.com/seuusuario/seurepositorio.git
                #Isso vai baixar o repositório para sua máquina.

#Abra a pasta clonada no VSCode
#Use File > Open Folder e selecione a pasta do repositório.
#Faça alterações e salve os arquivos
#Edite seus arquivos normalmente no VSCode.
#Adicione, commit e envie suas alterações

            #No terminal:
                git add .
                git commit -m "Update"
                git push origin Desenvolvimento
                #Autenticação com GitHub
                git pull origin Produção --allow-unrelated-histories

#Ao fazer o push, o Git pode pedir autenticação.

#Use um token de acesso pessoal (PAT) em vez da senha. Você pode gerar um token em github.com/settings/tokens.

#Puxe as alterações do GitHub para o seu repositório local:

#Isso vai tentar mesclar as mudanças do GitHub com as suas.

#Resolva conflitos (se houver):

#Se aparecerem conflitos, o VSCode vai mostrar os arquivos com conflitos.

#Escolha entre manter sua versão, a versão remota ou mesclar manualmente.

            #Depois de resolver, salve os arquivos e faça:
                git add .
                git commit -m "Resolvendo conflitos"
                #Agora você pode fazer o push:
                git push origin main

#-----------------------------------------------------------------------------------------------------------------------------------------

                        #🧠 Dica extra: se quiser sobrescrever o remoto (⚠️ com cuidado)
                        #Se você tem certeza de que quer sobrescrever o que está no GitHub com sua versão local:


                #COMANDO PARA FORÇAR O PUSH (CUIDADO, ISSO PODE APAGAR MUDANÇAS REMOTAS):
                    git push --force origin main


#Etapas e comandos para criar um Pull Request#

    Git checkout -b nome-do-branch
    git add .
    git commit -m "Update"
    git push origin Desenvolvimento


#Criar o Pull Request
    #Isso é feito na interface do GitHub:
    #Vá até o repositório.
    #Clique em “Compare & pull request”.
    #Adicione título e descrição.
    #Clique em “Create pull request”.
    #Alternativamente, você pode usar a CLI do GitHub com:
        gh pr create --base main --head nome-do-branch --title "Título" --body "Descrição"

#COMANDOS Pull Requests ABERTOS:#

        gh pr list

#Ver detalhes de um PR

        gh pr view --web


#Mesclar um PR

        gh pr merge ID-do-PR


#Fechar um PR sem mesclar

        gh pr close ID-do-PR


#------------------------------------------------------------------------------------------------------------------------------------------

#Comandos de Branch no Git#

#📌 Criar uma nova branch

        git branch nome-da-branch


#🔀 Mudar para uma branch existente
        git checkout nome-da-branch


#Ou, com versões mais recentes do Git:
        git switch nome-da-branch


#🌱 Criar e mudar para uma nova branch
        git checkout -b nome-da-branch
        git switch -c nome-da-branch


#📋 Listar todas as branches
        git branch


#Com todas as remotas:
        git branch -a


#🧹 Deletar uma branch local
        git branch -d nome-da-branch


#orçar a exclusão (caso não tenha sido mesclada):
        git branch -D nome-da-branch


#📤 Enviar uma branch para o repositório remoto
        git push origin nome-da-branch


#🔄 Mesclar uma branch à atual
        git merge nome-da-branch


#🔍 Ver histórico de branches e merges
        git log --oneline --graph --all

#----------------------------------------------------------------------------------------------------------------------------------------


#A estrutura de arquivos de um repositório GitHub é composta por elementos que organizam, versionam e documentam o projeto. Cada arquivo tem uma função específica que contribui para o funcionamento e a colaboração no projeto.
#Aqui está uma explicação detalhada dos principais arquivos e pastas que você pode encontrar:

#🗂️ Estrutura comum de um repositório GitHub
#1. .git/ (pasta oculta)

#Função: Armazena todos os dados internos do Git, como histórico de commits, branches, configurações e objetos.

# Arquivos importantes:
#- .git/HEAD: Aponta para o branch atual.
#- .git/config: Configurações do repositório local.
#- .git/refs/: Contém referências para branches e tags.
#- .git/objects/: Guarda os objetos do Git (blobs, trees, commits).

#2. README.md
#- Função: Documento principal de apresentação do projeto.
#- Conteúdo: Explica o propósito do projeto, como instalar, usar e contribuir. Escrito em Markdown.

#3. LICENSE
#- Função: Define os termos legais de uso do projeto.
#- Exemplos: MIT, GPL, Apache. Especifica se o código pode ser modificado, distribuído, usado comercialmente etc.

#4. .gitignore
#- Função: Lista arquivos e pastas que o Git deve ignorar.
#- Exemplo: node_modules/, *.log, dist/.

#5. CONTRIBUTING.md
#- Função: Guia para quem deseja contribuir com o projeto.
#- Conteúdo: Regras de estilo, como abrir issues ou pull requests, testes exigidos etc.

#6. CHANGELOG.md
#- Função: Histórico de alterações do projeto.
#- Conteúdo: Lista de versões, correções, melhorias e mudanças significativas.
#7. CODEOWNERS
#- Função: Define quem é responsável por quais partes do código.
#- Impacto: GitHub pode solicitar revisão automática desses responsáveis em pull requests.
#8. .github/ (pasta)
#- Função: Contém arquivos de configuração específicos do GitHub.
#- Subitens comuns:
#- workflows/: Automação com GitHub Actions.
#- ISSUE_TEMPLATE/: Modelos para criação de issues.
#- PULL_REQUEST_TEMPLATE.md: Modelo para pull requests.
#9. docs/ (pasta)
#- Função: Armazena documentação adicional do projeto.
#- Pode conter: Tutoriais, diagramas, guias de API.
#10. src/ ou app/ (pasta)
#- Função: Contém o código-fonte principal do projeto.
#- Organização: Pode ser dividido por módulos, componentes, serviços etc.
#11. tests/ ou tests/ (pasta)
#- Função: Armazena os testes automatizados do projeto.
#- Tipos: Unitários, de integração, end-to-end.

#🛠️ Arquivos adicionais em projetos específicos
#- package.json (Node.js): Gerencia dependências, scripts e metadados do projeto.
#- requirements.txt (Python): Lista pacotes necessários.
#- Dockerfile: Define como criar uma imagem Docker do projeto.
#- Makefile: Automatiza tarefas via terminal.

#----------------------------------------------------------------------------------------------------------------------------------------

                                                        #ERROS COMUNS GIT#

#Esse erro do Git — fatal: refusing to merge unrelated histories — acontece quando você tenta fazer um git pull ou git merge entre dois repositórios (ou branches) que não compartilham um histórico comum. É bem comum em situações como:
#- Você inicializou um repositório local (git init) e depois tentou dar git pull de um remoto que já tinha commits.
#- Você clonou um repositório, mas o remoto foi recriado ou reescrito (por exemplo, com git init --bare ou git push --force).
# Você está lidando com submódulos e o repositório principal aponta para um commit que não existe no histórico atual do submódulo.


#🛠 Como resolver
#1. Se você quer forçar o merge mesmo sem histórico comum
#Use a flag --allow-unrelated-histories:
        git pull origin main --allow-unrelated-histories
        git merge origin/main --allow-unrelated-histories


#Isso vai permitir que o Git combine os dois históricos diferentes em um commit de merge.

#2. Se você quer alinhar o histórico corretamente
#- Verifique se está na branch certa:
        git checkout main

#- Confirme o remoto:
        git remote -v
#- Se o repositório remoto foi recriado, talvez seja melhor resetar:
        git fetch origin
        git reset --hard origin/main
#⚠️ Isso descarta suas alterações locais, então use apenas se não precisar delas.

#3. No caso de submódulos
#Se o erro aparecer ao atualizar um submódulo:
        git submodule update --init --recursive


#E se ainda assim houver conflito, você pode entrar no submódulo e alinhar manualmente:
        cd Projetos-Automates-em-Python
        git pull origin main --allow-unrelated-histories


#Depois volte ao repositório principal e atualize a referência:
        cd ..
        git add Projetos-Automates-em-Python
        git commit -m "Atualiza referência do submódulo"

