defmodule ExMachina.TestRepo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :clientId, :integer, primary_key: true
      add :name, :string
    end
  end
end
