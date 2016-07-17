defmodule TestHelpers.ResourceHelper do
  defmacro test_resource(module, opts \\ []) do
    quote do
      test "#{unquote(module)}.load/2" do
        use_cassette "#{unquote(module)}.get" do
          resource = apply(unquote(module), :get!, [unquote(opts)[:id] || 1])

          if is_nil(resource.id) do
            assert {:err, "Can't fetch resource without ID"} == apply(unquote(module), :load, [resource])
          else
            {:ok, retrieved_resource} = apply(unquote(module), :load, [resource])

            assert is_map(retrieved_resource)

            for {field, value} <- unquote(Keyword.delete(opts, :id)) do
              assert Map.get(retrieved_resource, field) == value
            end
          end
        end
      end

      test "#{unquote(module)}.load!/2" do
        use_cassette "#{unquote(module)}.get" do
          resource = apply(unquote(module), :get!, [unquote(opts)[:id] || 1])

          if is_nil(resource.id) do
            assert_raise RuntimeError, "Can't fetch resource without ID", fn ->
              apply(unquote(module), :load!, [resource])
            end
          else
            retrieved_resource = apply(unquote(module), :load!, [resource])

            assert is_map(retrieved_resource)

            for {field, value} <- unquote(Keyword.delete(opts, :id)) do
              assert Map.get(retrieved_resource, field) == value
            end
          end
        end
      end

      test "#{unquote(module)}.get/3" do
        use_cassette "#{unquote(module)}.get" do
          {:ok, resource} = apply(unquote(module), :get, [unquote(opts)[:id] || 1])

          assert is_map(resource)

          for {field, value} <- unquote(Keyword.delete(opts, :id)) do
            assert Map.get(resource, field) == value
          end
        end
      end

      test "#{unquote(module)}.get!/3" do
        use_cassette "#{unquote(module)}.get" do
          resource = apply(unquote(module), :get!, [unquote(opts)[:id] || 1])

          assert is_map(resource)

          for {field, value} <- unquote(Keyword.delete(opts, :id)) do
            assert Map.get(resource, field) == value
          end
        end
      end

      test "#{unquote(module)}.list/3" do
        use_cassette "#{unquote(module)}.list" do
          {:ok, resources} = apply(unquote(module), :list, [[limit: 2]])

          assert is_list(resources)
          assert length(resources) <= 2
        end
      end

      test "#{unquote(module)}.list!/3" do
        use_cassette "#{unquote(module)}.list" do
          resources = apply(unquote(module), :list!, [[limit: 2]])

          assert is_list(resources)
          assert length(resources) <= 2
        end
      end
    end
  end
end
