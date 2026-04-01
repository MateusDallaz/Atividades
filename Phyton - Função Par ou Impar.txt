def parImpar(numero):
    if numero %2 == 0:
        return 'O número é par';
    else:
        return 'O número é impar';

while True:
    n1 = int(input('Digite um número (Digite 0 para parar): '));
    if n1 == 0:
        break;
    
    resultado = parImpar(n1);
    print(resultado);