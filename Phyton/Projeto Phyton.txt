cliente = [];

def cadastrarCliente():
    print('\n--- Cadastrar Cliente ---');
    nome = input('Digite seu nome: ');
    idade = int(input('Digite sua idade: '));
    if idade >= 18:
        print('\nO cliente é maior de idade. \n');
    else:
        print('\nO cliente é menor de idade. \n');
    telefone = input('Digite seu telefone: ');
    cliente.append([nome, idade, telefone]);
    print('\n--- Cliente cadastrado com sucesso! ---\n');

def mostrarDados():
    print('\n--- Dados do Cliente  ---');
    if cliente == []:
        print('Nenhum cadastro encontrado\n');
    else:
        for i, c in enumerate(cliente, start=1):
            print(f'\n{i} - Nome: {c[0]} | Idade: {c[1]} | Telefone: {c[2]}\n');
        

def atualizarDados():
    print('\n--- Atualizar Dados ---');
    
    if cliente == []:
        print('Nenhum cadastro encontrado.\n');
    else:
        mostrarDados();
        
        indice = int(input('Qual cadastro você deseja alterar? Digite o número: '))-1;

        if indice >= 0 and indice < len(cliente):
            
            print('\nO que você deseja alterar?');
            print('1 - Nome');
            print('2 - Idade');
            print('3 - Telefone');

            opcao = input('\nEscolha uma opção: ');

            if opcao == '1':
                novonome = input('\nDigite o novo nome: ');
                cliente[indice][0] = novonome;

            elif opcao == '2':
                novaidade = int(input('\nDigite a nova idade: '));
                cliente[indice][1] = novaidade;

            elif opcao == '3':
                novotelefone = input('\nDigite o novo telefone: ');
                cliente[indice][2] = novotelefone;

            else:
                print('\nOpção inválida!\n');
                return atualizarDados();

            print('\n--- Dado atualizado com sucesso!---\n');

        else:
            print('Índice inválido.\n')
        
def menu():
    while True:
        print('--- Menu de interação ---\n')
        print('1 - Cadastrar Cliente');
        print('2 - Mostrar Dados do Cliente');
        print('3 - Atualizar  Dados');
        print('4 - Sair');
        
        opcao = input('\nEscolha uma opção: ');
        
        if opcao == '1':
            cadastrarCliente();
        elif opcao == '2':
            mostrarDados();
        elif opcao == '3':
            atualizarDados();
        elif opcao == '4':
            print('\n--- Até a próxima! ---');
            break;
        else:
            print('\n--- Por gentileza digite uma opção valida ---\n');
            
menu();