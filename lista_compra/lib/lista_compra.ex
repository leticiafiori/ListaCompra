defmodule ListaCompra do
  @spec split(
          listaCompras :: [
            {item :: String.t(), quantidade :: pos_integer(),
             preco_unitario_centavos :: pos_integer()}
          ],
          emails :: [String.t()]
        ) :: [%{String.t() => non_neg_integer()}]
  def split(listaCompras, emails) do
    email = Enum.uniq(emails)

    valorTotal = valorCalculado(listaCompras)

  end
end
