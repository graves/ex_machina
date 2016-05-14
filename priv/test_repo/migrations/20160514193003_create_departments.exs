defmodule ExMachina.TestRepo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:departments, primary_key: false) do
      add :departmentId, :integer, primary_key: true
      add :name, :string
    end
  end
end
