# Desafio Elixir - Lista de Compra

* Projeto para o precesso seletivo da Stone - Desafio Elixir | Risk Team

## Descrição do projeto
Imagine uma lista de compras. Ela possui:
* Itens;
* Quantidade de cada item;
* Preço por unidade/peso/pacote de cada item.

Com base nisso, desenvolva uma função (ou método) que irá receber uma lista de compras
(como a detalhada acima) e uma lista de e-mails. Aqui, cada e-mail representa uma pessoa.

A função deve:
 * Calcular a soma dos valores, ou seja, multiplicar o preço de cada item por sua
quantidade e somar todos os itens.
 * Dividir o valor de forma igual entre a quantidade de e-mails.
 * Retornar um mapa/dicionário onde a chave será o e-mail e o valor será quanto ele
deve pagar nessa conta.
 * Escrever testes unitários para a função.

## Documentação 

Para executar certifique-se de ter previamente instalado na sua máquina o Elixir na versão `1.13`

1. Clone o projeto do git
2. Abra o terminal e acesse a pasta do projeto `cd ListaCompra`
3. Para verificar se os testes unitários estão funcionando, execute `mix test`
4. Para testar uma lista de compras genérica será necessário acessar o shell do projeto. Para isso execute o comando `iex -S mix`
5. Dentro do shell execute a função `ListaCompra.slipt(<lista_de_compras>, <lista_emails>)` 
* A lista_de_compras é uma lista no formato:`[{"item1", quantidade_item1, valor_em_centavos_item1}, {"item2", quantidade_item2, valor_em_centavos_item2}]`
 * A lista_emails é uma lista no formato: `["nome1@email.com", "nome2@email.com"]`. Os emails das lista possuem valores únicos, caso se repitam isso será validado no código, transformando apensa em um. 
 * Exemplo, ao executar: 
     `ListaCompra.split([{"banana", 1, 1}, {"maçã", 3, 10}], ["leticia@email.com", "leticia@email.com"])` 
     Teremos como saída um mapa com um único email, da seguinte maneira:
     `%{"leticia@email.com" => 31}`


