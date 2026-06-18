import requests

def pokemom_list():
    quantidade = input('Quantos Pokemons deseja listar? ')

    pokemonsDisponiveis = "https://pokeapi.co/api/v2/pokemon?limit=" + quantidade

    listagem = requests.get(pokemonsDisponiveis)

    nomes = listagem.json()

    for lista in nomes["results"]:
        print(lista["name"])



def pokemom_info():
    pokemon = input('Digite o nome do Pokemon: ').lower().strip()

    url = "https://pokeapi.co/api/v2/pokemon/" + pokemon

    respostas = requests.get(url)

    print ("status: ", respostas.status_code)

    dados = respostas.json()

    print ("--- Informações Gerais ---")
    print ("Nome: ", dados["name"])

    print ("Número: ", dados["id"])
    print ("Altura: ", dados["height"])
    print ("Peso: ", dados["weight"])

    print ("--- Tipo ---")
    for item in dados["types"]:
        print("-", item["type"]["name"])

    print("--- Status ---")
    for stat in dados["stats"]:
        print('- ', stat['stat']['name'], ':', stat['base_stat'])

def pokemom_battle():
    pokemon1 = input('Digite o nome do 1° Pokemon: ').lower().strip()
    pokemon2 = input('Digite o nome do 2° Pokemon: ').lower().strip()

    url1 = "https://pokeapi.co/api/v2/pokemon/" + pokemon1
    url2 = "https://pokeapi.co/api/v2/pokemon/" + pokemon2

    lutador1 = requests.get(url1)
    lutador2 = requests.get(url2)

    dados1 = lutador1.json()
    dados2 = lutador2.json()

    print(f"\n--- Status: {pokemon1} ---")
    for stat1 in dados1["stats"]:
        print('- ', stat1['stat']['name'], ':', stat1['base_stat'])
    print(f"\n--- Status: {pokemon2} ---")
    for stat2 in dados2["stats"]:
        print('- ', stat2['stat']['name'], ':', stat2['base_stat'])

    
    
def menu():
    print('--- Menu de Interação ---\n')

    while True:
        print ('Opção 1: Listagem')
        print ('Opção 2: Informações gerais')
        print ('Opção 3: Batalha de Pokemons')
        print ('Opção 4: Sair\n')

        opcao = input('Digite uma opção: ')

        if opcao == '1':
            print ('--- Listagem de Pokemons ---\n')
            pokemom_list()
        elif opcao == '2':
            print ('--- Informaçoes ---\n')
            pokemom_info()
        elif opcao == '3':
            print ('--- Batalha de Pokemons ---\n')
            pokemom_battle()
        elif opcao == '4':
            print ('Até Logo!')
            break
        else:
            print('Digite uma opção valida')
        

menu()