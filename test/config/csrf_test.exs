defmodule Sobelow.Config.CSRFTest do
  use ExUnit.Case
  alias Sobelow.Utils

  test "checks normal router" do
  	router = "./test/fixtures/csrf/good_router.ex"
    refute Utils.get_pipelines(router)
					 |> Enum.any?(&Utils.is_vuln_pipeline(&1, :csrf))
  end

  test "checks normal router with named session key" do
  	router = "./test/fixtures/csrf/good_router_with_session_key.ex"
    refute Utils.get_pipelines(router)
					 |> Enum.any?(&Utils.is_vuln_pipeline(&1, :csrf))
  end

  test "checks normal router with with" do
    router = "./test/fixtures/csrf/good_router_with_with.ex"
    refute Utils.get_pipelines(router)
           |> Enum.any?(&Utils.is_vuln_pipeline(&1, :csrf))
  end

  test "checks bad router" do
  	router = "./test/fixtures/csrf/bad_router.ex"
    assert Utils.get_pipelines(router)
					 |> Enum.any?(&Utils.is_vuln_pipeline(&1, :csrf))
  end
end