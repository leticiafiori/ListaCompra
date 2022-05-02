defmodule ListaCompraTest do
  use ExUnit.Case
  doctest ListaCompra

  describe "split\2" do
    test "caso em que o valor total é menor ou igual ao número de emails" do
      emails = ~w(
        leticia@email.com
        maria@email.com
        teste@email.com
        maria@email.com
        leticia@email.com
        maria@email.com
      )

      assert %{"leticia@email.com" => 1, "maria@email.com" => 0, "teste@email.com" => 0} ==
               ListaCompra.split([{"banana", 1, 1}, {"maçã", 0, 10}], emails)

      assert %{"leticia@email.com" => 1, "maria@email.com" => 1, "teste@email.com" => 0} ==
               ListaCompra.split([{"banana", 2, 1}, {"maçã", 0, 10}], emails)

      assert %{"leticia@email.com" => 1, "maria@email.com" => 1, "teste@email.com" => 1} ==
               ListaCompra.split([{"banana", 1, 1}, {"maçã", 1, 2}], emails)
    end

    test "caso em que há mais de um centavo de resto" do
      emails = ~w(
        leticia@email.com
        maria@email.com
        teste@email.com
        maria@email.com
        leticia@email.com
        maria@email.com
      )

      assert %{"leticia@email.com" => 2, "maria@email.com" => 2, "teste@email.com" => 1} ==
               ListaCompra.split([{"banana", 1, 1}, {"maçã", 1, 2}, {"uva", 2, 1}], emails)
    end

    test "erro de arredondamento" do
      assert %{
               "1@email.com" => 1,
               "2@email.com" => 1,
               "3@email.com" => 1,
               "4@email.com" => 1,
               "5@email.com" => 1,
               "6@email.com" => 1,
               "7@email.com" => 1,
               "8@email.com" => 0,
               "9@email.com" => 0,
               "10@email.com" => 0,
               "11@email.com" => 0
             } == ListaCompra.split([{"banana", 7, 1}], Enum.map(1..11, &"#{&1}@email.com"))
    end
  end
end
