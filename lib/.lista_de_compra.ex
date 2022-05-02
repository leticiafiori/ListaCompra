defmodule ListaCompra do
  @spec split(
          lista_compras :: [
            {item :: String.t(), quantidade :: pos_integer(),
             preco_unitario_centavos :: pos_integer()}
          ],
          emails :: [String.t()]
        ) :: [%{String.t() => non_neg_integer()}]

  def split(lista_compras, emails) do

    # Recebe o email garantindo que seja unico
    emails = Enum.uniq(emails)

    #Chama função para calcular o valor da lista
    valor_total = valor_calculado(lista_compras)

    #calcula a quantidade de emails para realizar a divisão
    qtde_emails = length(emails)

    #calcula a divisão do valor total pela quantidade de pessoas(email)
    valor_pessoa = div(valor_total, qtde_emails)

    #calcula o resto da divisão para não "sobrar" nenhum valor
    resto = rem(valor_total, qtde_emails)


    # realizando a distribuição do resto pela propria lista com IF
    emails
    |> Enum.with_index(fn email, idx ->
      if idx < resto do
        {email, valor_pessoa + 1}
      else
        {email, valor_pessoa}
      end
    end)
    |> Map.new()

    # # Fazendo a distribuição do resto via função
    # emails
    # |> Map.new(fn email -> {email, valor_pessoa} end)
    # |> distribute_rem(emails, resto)

  end

    #Função para calcular a lista
    defp valor_calculado(list) do

    # Solução com enum reduce
    # Enum.reduce(list, 0, fn {_nome, qtde, valor_uni}, acumula ->
    #    acumula + qtde * valor_uni
    #  end)

    # Solução com for
    # for {_nome, qtde, valor_uni} <- list, reduce: 0 do
    #   acumula ->
    #     acumula + qtde * valor_uni
    # end

    # Solução com map
    #recebemos a lista e passamos via pipe operator a lista para as funções map e sum
    list
    |> Enum.map(fn {_nome, qtde, valor_uni} -> qtde * valor_uni end)
    |> Enum.sum()

    end

    # # Função para trabalhar com o resto - caso não tenha, retonar a lista sem alteração
    # defp distribute_rem(map, emails, 0), do: map

    # #Função para trabalhar com o resto - caso tenha resto, faz a distribuição dele
    # defp distribute_rem(map, [email | t], resto) do
    #   valor = map[email]
    #   modified_map = Map.put(map, email, valor + 1)

    #   distribute_rem(modified_map, t ++ [email], resto - 1)
    # end



end
