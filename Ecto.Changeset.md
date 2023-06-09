### Changesets Crash Course

- In order to insert, update or delete data from the database, Ecto.Repo.insert/2, update/2 and delete/2 require a changeset as their first parameter
- Changesets validate data before being inserted to the database by checking for potential errors, asserting that required fields are passed, asserting that non-empty fileds have data, etc

#### Empty Changeset

```
iex> %Ecto.Changeset{}
%Ecto.Changeset<action: nil, changes: %{}, errors: [], data: nil, valid?: false>
```

- For a changeset to be truly useful, we provide a blueprint of what the data is like. We use Schemas for that.

```
defmodule Friends.Person do
  use Ecto.Schema

  schema "people" do
    field :name, :string
    field :age, :integer, default: 0
  end
end
```

- To create a changeset using the Person schema, we are going to use Ecto.Changeset.cast/3:

```
iex> Ecto.Changeset.cast(%Friends.Person{name: "Amos"}, %{}, [:name, :age])
%Ecto.Changeset<action: nil, changes: %{}, errors: [], data: %Friends.Person<>, valid?: true>
```

- In the above changeset,
  - The first parameter is the original data - an initial `%Friends.Person{}` struct
  - Second parameter holds the changes we want to make - in this case an empty map.
  - Third parameter is what makes `cast/3` special: it is a list of fields allowed to go through, which gives the ability to control what fields can be changed and safe-guard the rest

```
iex> Ecto.Changeset.cast(%Friends.Person{name: "Bob"}, %{"name" => "Jack"}, [:name, :age])
%Ecto.Changeset<
  action: nil,
  changes: %{name: "Jack"},
  errors: [],
  data: %Friends.Person<>,
  valid?: true
>
```

#### Validations

- Ecto comes with a number of validation functions built-in.

```
defmodule Friends.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string
    field :age, :integer, default: 0
  end
end
```

- It is common to have one or more changeset creator functions for a schema.
- Lets make one that accepts a struct, a map of changes, and returns a changeset:

```
def changeset(struct, params) do
  struct
  |> cast(params, [:name, :age])
end
```

- Now, we can ensure that name is always present:

```
def changeset(struct, params) do
  struct
  |> cast(params, [:name, :age])
  |> validate_required([:name])
end
```

- Some other built-in validators in `Ecto.Changeset` are:

  - validate_length/2
  - validate_acceptance/3
  - validate_change/3 & /4
  - validate_confirmation/3
  - validate_exclusion/4 & validate_inclusion/4
  - validate_format/4
  - validate_number/3
  - validate_subset/4

  #### **Custom Validations**

  - We can create our own validators, as seen below:

  ```
  @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]
  def validate_fictional_name(changeset) do
    name = get_field(changeset, :name)

    if name in @fictional_names do
      changeset
    else
      add_error(changeset, :name, "is not a superhero")
    end
  end

  def changeset(struct, params) do
    struct
    |> cast{params, [:name, :age]}
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
    |> validate_fictional_name()
  end
  ```

#### Adding Changes Manually

- A helper function `put_changes/3` is used for this purpose

- In our example, rather than making the `name` field required, let's allow users to sign up without a name, and call them "Anonymous":

```
def set_name_if_anonymous(changeset) do
  name = get_field(changeset, :name)

  if is_nil(name) do
    put_change(changeset, :name, "Anonymous")
  else
    changeset
  end
end

# We can set user's name as "Anonymous" only when they register in our application:
def registration_changeset(struct, params) do
  struct
  |> cast(params, [:name, :age])
  |> set_name_if_anonymous()
end
```

- Having changeset creator functions that have specific responsibility (like `registration_changeset/2`) is common practice.
- The above function could be used in a dedicated `sign_up/1` helper function:

```
def sign_up(params) do
  %Friends.Person{}
  |> Friends.Person.registration_changeset(params)
  |> Repo.insert()
end
```
