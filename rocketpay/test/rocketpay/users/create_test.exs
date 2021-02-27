defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "When all params are valid, return an user" do
      params = %{
        name: "Gleycon",
        password: "123456",
        nickname: "gxavier",
        email: "gleyconxcarlos@gmail.com",
        age: 27
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Gleycon", age: 27, id: ^user_id} = user

    end

    test "When there are invalid params, return an error" do
      params = %{
        name: "Gleycon",
        password: "",
        nickname: "gxavier",
        email: "gleyconxcarlos@gmail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end

  end
end
