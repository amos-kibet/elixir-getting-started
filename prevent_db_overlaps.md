## Handling Duplicate Data Entry in Databases

Scenario:
Imagine you build an appointment scheduling service.
A service that allows patients to book an appointment with their doctor.
You want to prevent double-booking of a doctor for the same time slot.
So, if one patient has an appointment on Tuesday from 9am to 10am,
another patient shouldn’t be able to book that same time slot

Implements Exclusion Constraint
[READ](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-EXCLUSION)

### Example

```elixir
# Sample Appointment model
schema "appointments" do
  field :doctor_id, :integer
  field :cancelled, :boolean, default: false
  field :from, :utc_datetime
  field :until, :utc_datetime
end
```

```elixir
# Sample changeset
def changeset(appointment, attrs) do
  appointment
  |> cast(attrs, [:doctor_id, :cancelled, :from, :unti])
  |> exclusion_constraint(:from, name: :overlapping_appointments) # Read => https://hexdocs.pm/ecto/Ecto.Changeset.html#exclusion_constraint/3
  |> validate_required([:doctor_id, :from, :until])
end
```

```elixir
# Sample migration
defmodule Demo.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def up do
    create table(:appointments) do
      add :doctor_id, :integer
      add :canceled, :boolean, default: false

      add :from, :utc_datetime
      add :until, :utc_datetime
    end

    execute "CREATE EXTENSION IF NOT EXISTS btree_gist;"

    execute """
      ALTER TABLE appointments
      ADD CONSTRAINT overlapping_appointments
      EXCLUDE USING GIST (
        doctor_id WITH =,
        tsrange("from", "until", '[)') WITH &&
      ) WHERE (NOT canceled);
    """
  end

  def down do
    drop table(:appointments)
  end
end
```
