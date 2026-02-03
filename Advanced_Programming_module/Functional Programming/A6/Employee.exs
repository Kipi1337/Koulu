defmodule Employee do
  defstruct first_name: "", last_name: "", id_number: 1, salary: 0, job: :none

  # Function to create a new employee with a default id_number that increments by 1
  def new(first_name, last_name) do
    %Employee{first_name: first_name, last_name: last_name, id_number: next_id()}
  end

  # Function to calculate the next id_number
  defp next_id do
    # This would be logic to calculate the next id
    # In a real system, you'd keep track of this in a DB or state
    # For simplicity, we'll assume it's just auto-incrementing starting from 1
    1
  end

  # Promote the employee
  def promote(%Employee{job: :none} = employee) do
    employee
    |> Map.put(:job, :coder)
    |> Map.put(:salary, 2000)
  end

  def promote(%Employee{job: :coder} = employee) do
    employee
    |> Map.put(:job, :designer)
    |> Map.put(:salary, employee.salary + 2000)
  end

  def promote(%Employee{job: :designer} = employee) do
    employee
    |> Map.put(:job, :manager)
    |> Map.put(:salary, employee.salary + 2000)
  end

  def promote(%Employee{job: :manager} = employee) do
    employee
    |> Map.put(:job, :ceo)
    |> Map.put(:salary, employee.salary + 2000)
  end

  # Demote the employee
  def demote(%Employee{job: :ceo} = employee) do
    employee
    |> Map.put(:job, :manager)
    |> Map.put(:salary, employee.salary - 2000)
  end

  def demote(%Employee{job: :manager} = employee) do
    employee
    |> Map.put(:job, :designer)
    |> Map.put(:salary, employee.salary - 2000)
  end

  def demote(%Employee{job: :designer} = employee) do
    employee
    |> Map.put(:job, :coder)
    |> Map.put(:salary, employee.salary - 2000)
  end

  def demote(%Employee{job: :coder} = employee) do
    employee
    |> Map.put(:job, :none)
    |> Map.put(:salary, 0)
  end
end

# Create a new employee
employee = Employee.new("John", "Doe")

# Promote the employee
employee = Employee.promote(employee)
IO.inspect(employee)

# Promote again
employee = Employee.promote(employee)
IO.inspect(employee)

# Demote the employee
employee = Employee.demote(employee)
IO.inspect(employee)
