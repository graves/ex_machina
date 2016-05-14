defmodule ExMachina.TestRepo.Migrations.Departments do
  use Ecto.Migration

  def change do
    create table(:departments, primary_key: false) do
      add :departmentId, :integer, primary_key: true
      add :clientId, :integer
      add :name, :string
    end
  end
end
