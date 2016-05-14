defmodule ExMachina.EctoCustomPrimaryKeyTest do
  use ExMachina.EctoCase
  alias ExMachina.TestRepo

  defmodule Department do
    use Ecto.Model
    @primary_key {:departmentId, :id, autogenerate: true}

    schema "departments" do
      field :name, :string
      belongs_to :client, ExMachina.EctoCustomPrimaryKeyTest.Client, foreign_key: :clientId, references: :clientId
    end
  end

  defmodule Client do
    use Ecto.Model
    @primary_key {:clientId, :id, autogenerate: true}

    schema "clients" do
      field :name, :string
    end
  end

  defmodule Factory do
    use ExMachina.Ecto, repo: TestRepo

    def factory(:department) do
      %Department{
        name: "Test Department",
        client: build(:client, name: "Test Client")
      }
    end

    def factory(:client) do
      %Client{
        name: "Test Client",
      }
    end
  end

  test "department factory can be created" do
    department = Factory.create(:department)

    assert %{name: "Test Department"} = department
  end
end
