defmodule TestHelpers.ResourceHelper do
  defmacro test_resource(module, opts \\ []) do
    quote do
      test "#{unquote(module)}.get!" do
        use_cassette "#{unquote(module)}.get" do
          resource = apply(unquote(module), :get!, [unquote(opts)[:id] || 1])

          assert is_map(resource)

          for {field, value} <- unquote(Keyword.delete(opts, :id)) do
            assert Map.get(resource, field) == value
          end
        end
      end

      test "#{unquote(module)}.list!" do
        use_cassette "#{unquote(module)}.list" do
          resources = apply(unquote(module), :list!, [[limit: 2]])

          assert is_list(resources)
          assert length(resources) <= 2
        end
      end
    end
  end
end
