#Exercicio 1:

nome = input('Digite seu nome: ');
idade = int(input('Digite sua idade: '));
cidade = input('Digite sua cidade: ')

print(f'Olá, meu nome é {nome}, tenho {idade} anos e moro em {cidade}')


#Exercicio 2:

n1 = float(input('Digite o primeiro numero: '));
n2 = float(input('Digite o segundo numero: '));

soma = n1+n2;
subtracao = n1-n2;
multiplicacao = n1*n2;
divisao = n1/n2;

print(f'\nA soma de {n1} + {n2} é: {soma}');
print(f'\nA subtração de {n1} - {n2} é: {subtracao}');
print(f'\nA multiplicação de {n1} * {n2} é: {multiplicacao}');
print(f'\nA divisão de {n1} / {n2} é: {divisao}');


#Exercicio 3:

numero = int(input('Digite um número: '));

for i in range(1, 11):
    resultado = numero*i;
    print(f'{numero} * {i} = {resultado}');


#Exercicio 4:

while True:
    numero = int(input('Digite o número secreto: '));
    
    if numero > 10:
        print(f'O  numero é menor que {numero}');
    elif numero < 10:
        print(f'O  numero é maior que {numero}');
    else:
        print('Você acertou o número');
        break;
        

#Exercicio 5:

compras = [];

for i in range(5):
    item = input('Digite um item: ');
    
    compras.append(item)
   
    for indice, i in enumerate(compras, start=1):
        print(f'Você precisa comprar{indice}, {i}');

#Exercicio 6:

nota = [7.5, 8.9, 10, 6.1, 3, 5];

meida = sum(nota)/len(nota);

print(f'A maior nota é: {max(nota)}\n A menor é: {min(nota)}\n e a media da turma é {meida}');


#Exercicio 7:

def par_ou_impar(n):
    if n %2 == 0:
        print(f'O número {n} é par');
    else:
        print(f'O número {n} é Impar');
        
par_ou_impar(1);
par_ou_impar(8);
par_ou_impar(3);

#Exercicio 8:

peso = float(input('Digite seu peso (em Kg): '));
altura = float(input('Digite sua altura (em metros): '));

def calculo_imc():
    imc = peso/(altura**2);
    return(imc);
    
def classificar_imc():
    if calculo_imc() < 18.5:
        print('Você está abaixo do peso');
    elif calculo_imc() >= 18.5 and calculo_imc() < 25:
        print('Você está no peso ideal');
    elif calculo_imc() >= 25 and calculo_imc() < 30:
        print('Você está acima do peso');
    else:
        print('Você está obeso');

classificar_imc();


#Exercicio 9:

tarefas = []  # lista de tarefas

def listar():
    if len(tarefas) == 0:
        print('Nenhuma tarefa cadastrada.')
    else:
        print('\n--- Lista de Tarefas ---')
        for i, t in enumerate(tarefas, 1):
            print(f'{i}. {t}')

def adicionar():
    tarefa = input('Digite a tarefa que deseja adicionar: ')
    tarefas.append(tarefa)
    print('Tarefa adicionada com sucesso!')

def remover():
    if len(tarefas) == 0:
        print('Nenhuma tarefa para remover.')
    else:
        listar()
        tarefa = input('Digite o nome da tarefa que deseja remover: ')
        
        if tarefa in tarefas:
            tarefas.remove(tarefa)
            print('Tarefa removida com sucesso!')
        else:
            print('Tarefa não encontrada.')

while True:
    print('\n1 - Adicionar')
    print('2 - Remover')
    print('3 - Listar')
    print('4 - Sair')
    
    opcao = input('Escolha: ')
    
    if opcao == '1':
        adicionar()
    elif opcao == '2':
        remover()
    elif opcao == '3':
        listar()
    elif opcao == '4':
        print('Saindo do programa...')
        break
    else:
        print('Opção inválida. Tente novamente.')