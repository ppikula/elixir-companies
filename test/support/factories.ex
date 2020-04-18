defmodule Companies.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Companies.Repo

  alias Companies.Schema.{Company, Industry, Job, PendingChange, User}

  def company_factory do
    %Company{
      description: "A test company",
      industry: insert(:industry),
      name: sequence(:name, &"Test Company #{&1}"),
      url: "www.example.com"
    }
  end

  def job_factory do
    %Job{
      title: "Job",
      url: "www.example.com/joblisting",
      remote: false,
      expired: false,
      company: insert(:company)
    }
  end

  def industry_factory do
    %Industry{
      name: sequence(:name, &"Test Industry #{&1}")
    }
  end

  def pending_change_factory do
    %PendingChange{
      action: "create",
      changes: params_for(:company),
      resource: "company",
      user: insert(:user)
    }
  end

  def user_factory do
    %User{
      email: sequence(:email, &"user-#{&1}@example.com"),
      token: "abc1234",
      name: "test name",
      bio: "test bio",
      description: "test description",
      location: "test location",
      interests: "test interests",
      cv_url: "test cv url",
      looking_for_job: false
    }
  end

  def admin_factory do
    %{build(:user) | admin: true}
  end
end
