defmodule ListaCompra do
  @spec split(
          lista_compras :: [
            {item :: String.t(), quantidade :: pos_integer(),
             preco_unitario_centavos :: pos_integer()}
          ],
          emails :: [String.t()]
        ) :: [%{String.t() => non_neg_integer()}]

  def split(lista_compras, emails) do
    emails = Enum.uniq(emails)
    valor_total = valor_calculado(lista_compras)
    qtde_emails = length(emails)
    valor_pessoa = div(valor_total, qtde_emails)
    resto = rem(valor_total, qtde_emails)

    emails
    |> Enum.with_index(fn email, idx ->
      if idx < resto do
        {email, valor_pessoa + 1}
      else
        {email, valor_pessoa}
      end
    end)
    |> Map.new()
  end

  # Função para calcular a lista
  defp valor_calculado(list) do
    list
    |> Enum.map(fn {_nome, qtde, valor_uni} -> qtde * valor_uni end)
    |> Enum.sum()
  end
end
