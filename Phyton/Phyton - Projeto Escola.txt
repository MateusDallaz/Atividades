turma = []

def cadastro():
    print('--- Cadastro de Turma ---\n')
    
    nomealuno = input('Digite o nome do aluno: ')
    materia = input('Digite a matéria: ')
    serie = input('Digite a série que o aluno frequenta: ')
    
    turma.append([nomealuno, materia, serie, None, None])
    
    print('\n--- Cadastro realizado com sucesso ---\n')

def mostrarDados():
    print('\n--- Cadastros Realizados ---\n')
    
    if turma == []:
        print('Nenhum cadastro encontrado\n')
    else:
        for i, c in enumerate(turma, start=1):
            print(f'{i} - Nome: {c[0]} | Matéria: {c[1]} | Série: {c[2]} | 1ª Nota: {c[3]} | 2ª Nota: {c[4]}')

def notas():
    print('\n--- Cadastro de Notas ---\n')
    
    if turma == []:
        print('Nenhum cadastro encontrado\n')
    else:
        mostrarDados()
        
        indice = int(input('\nEscolha o aluno para adicionar notas: ')) - 1
        
        if 0 <= indice < len(turma):
            nota1 = float(input('Digite a 1ª nota do aluno: '))
            nota2 = float(input('Digite a 2ª nota do aluno: '))
            
            turma[indice][3] = nota1
            turma[indice][4] = nota2
            
            print('\n--- Notas cadastradas com sucesso ---\n')
        else:
            print('\nÍndice inválido!\n')

def media():
    print('\n--- Cálculo de Média ---\n')

    if turma == []:
        print('Nenhum aluno cadastrado\n')
    else:
        mostrarDados()

        indice = int(input('Escolha o aluno: ')) - 1
                
        if 0 <= indice < len(turma):
            nota1 = turma[indice][3]
            nota2 = turma[indice][4]
                    
            if nota1 is None or nota2 is None:
                print('Notas ainda não cadastradas\n')
            else:
                media = (nota1 + nota2) / 2
                print(f'A média do aluno {turma[indice][0]} é: {media:.2f}\n')
                
                if media >= 7:
                    print('Parabens, você foi aprovado')
                elif media >=5 and media <7:
                    print('Cuidado, você está em recuperação')
                else:
                    print('Burro, você reprovou')
        else:
            print('Índice inválido\n')

def menu():
    while True:
        print('--- Menu de Interação ---\n')
        print('1 - Cadastro de Turma')
        print('2 - Mostrar Cadastros')
        print('3 - Cadastro de Notas')
        print('4 - Cálculo de Média')
        print('5 - Sair')
        
        opcao = int(input('\nDigite uma opção: '))
        
        if opcao == 1:
            cadastro()
        elif opcao == 2:
            mostrarDados()
        elif opcao == 3:
            notas()
        elif opcao == 4:
            media()
        elif opcao == 5:
            print('\n--- Até a próxima ---')
            break
        else:
            print('Digite uma opção válida')

menu()