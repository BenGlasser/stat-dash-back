defmodule StatDashBack.SummonerTest do
  use StatDashBack.DataCase

  alias StatDashBack.Summoner

  describe "information" do
    alias StatDashBack.Summoner.Info

    import StatDashBack.SummonerFixtures

    @invalid_attrs %{name: nil, level: nil, rank: nil, icon: nil, mastery: nil}

    test "list_information/0 returns all information" do
      info = info_fixture()
      assert Summoner.list_information() == [info]
    end

    test "get_info!/1 returns the info with given id" do
      info = info_fixture()
      assert Summoner.get_info!(info.id) == info
    end

    test "create_info/1 with valid data creates a info" do
      valid_attrs = %{name: "some name", level: 42, rank: 42, icon: "some icon", mastery: 42}

      assert {:ok, %Info{} = info} = Summoner.create_info(valid_attrs)
      assert info.name == "some name"
      assert info.level == 42
      assert info.rank == 42
      assert info.icon == "some icon"
      assert info.mastery == 42
    end

    test "create_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Summoner.create_info(@invalid_attrs)
    end

    test "update_info/2 with valid data updates the info" do
      info = info_fixture()

      update_attrs = %{
        name: "some updated name",
        level: 43,
        rank: 43,
        icon: "some updated icon",
        mastery: 43
      }

      assert {:ok, %Info{} = info} = Summoner.update_info(info, update_attrs)
      assert info.name == "some updated name"
      assert info.level == 43
      assert info.rank == 43
      assert info.icon == "some updated icon"
      assert info.mastery == 43
    end

    test "update_info/2 with invalid data returns error changeset" do
      info = info_fixture()
      assert {:error, %Ecto.Changeset{}} = Summoner.update_info(info, @invalid_attrs)
      assert info == Summoner.get_info!(info.id)
    end

    test "delete_info/1 deletes the info" do
      info = info_fixture()
      assert {:ok, %Info{}} = Summoner.delete_info(info)
      assert_raise Ecto.NoResultsError, fn -> Summoner.get_info!(info.id) end
    end

    test "change_info/1 returns a info changeset" do
      info = info_fixture()
      assert %Ecto.Changeset{} = Summoner.change_info(info)
    end
  end
end
