defmodule(Kayrock.OffsetCommit) do
  @moduledoc false
  _ = " THIS CODE IS GENERATED BY KAYROCK"

  defmodule(V0.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(group_id: nil, topics: [], correlation_id: nil, client_id: nil)
    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      0
    end

    def(response_deserializer) do
      &V0.Response.deserialize/1
    end

    def(schema) do
      [
        group_id: :string,
        topics:
          {:array,
           [
             topic: :string,
             partitions: {:array, [partition: :int32, offset: :int64, metadata: :nullable_string]}
           ]}
      ]
    end

    def(serialize(%V0.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          serialize(:string, Map.fetch!(struct, :group_id)),
          case(Map.fetch!(struct, :topics)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :topic)),
                    case(Map.fetch!(v, :partitions)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:int32, Map.fetch!(v, :partition)),
                              serialize(:int64, Map.fetch!(v, :offset)),
                              serialize(:nullable_string, Map.fetch!(v, :metadata))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V0.Request) do
    def(serialize(%V0.Request{} = struct)) do
      V0.Request.serialize(struct)
    end

    def(api_vsn(%V0.Request{})) do
      V0.Request.api_vsn()
    end

    def(response_deserializer(%V0.Request{})) do
      V0.Request.response_deserializer()
    end
  end

  defmodule(V1.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      group_id: nil,
      generation_id: nil,
      member_id: nil,
      topics: [],
      correlation_id: nil,
      client_id: nil
    )

    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      1
    end

    def(response_deserializer) do
      &V1.Response.deserialize/1
    end

    def(schema) do
      [
        group_id: :string,
        generation_id: :int32,
        member_id: :string,
        topics:
          {:array,
           [
             topic: :string,
             partitions:
               {:array,
                [partition: :int32, offset: :int64, timestamp: :int64, metadata: :nullable_string]}
           ]}
      ]
    end

    def(serialize(%V1.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          serialize(:string, Map.fetch!(struct, :group_id)),
          serialize(:int32, Map.fetch!(struct, :generation_id)),
          serialize(:string, Map.fetch!(struct, :member_id)),
          case(Map.fetch!(struct, :topics)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :topic)),
                    case(Map.fetch!(v, :partitions)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:int32, Map.fetch!(v, :partition)),
                              serialize(:int64, Map.fetch!(v, :offset)),
                              serialize(:int64, Map.fetch!(v, :timestamp)),
                              serialize(:nullable_string, Map.fetch!(v, :metadata))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V1.Request) do
    def(serialize(%V1.Request{} = struct)) do
      V1.Request.serialize(struct)
    end

    def(api_vsn(%V1.Request{})) do
      V1.Request.api_vsn()
    end

    def(response_deserializer(%V1.Request{})) do
      V1.Request.response_deserializer()
    end
  end

  defmodule(V2.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      group_id: nil,
      generation_id: nil,
      member_id: nil,
      retention_time: nil,
      topics: [],
      correlation_id: nil,
      client_id: nil
    )

    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      2
    end

    def(response_deserializer) do
      &V2.Response.deserialize/1
    end

    def(schema) do
      [
        group_id: :string,
        generation_id: :int32,
        member_id: :string,
        retention_time: :int64,
        topics:
          {:array,
           [
             topic: :string,
             partitions: {:array, [partition: :int32, offset: :int64, metadata: :nullable_string]}
           ]}
      ]
    end

    def(serialize(%V2.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          serialize(:string, Map.fetch!(struct, :group_id)),
          serialize(:int32, Map.fetch!(struct, :generation_id)),
          serialize(:string, Map.fetch!(struct, :member_id)),
          serialize(:int64, Map.fetch!(struct, :retention_time)),
          case(Map.fetch!(struct, :topics)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :topic)),
                    case(Map.fetch!(v, :partitions)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:int32, Map.fetch!(v, :partition)),
                              serialize(:int64, Map.fetch!(v, :offset)),
                              serialize(:nullable_string, Map.fetch!(v, :metadata))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V2.Request) do
    def(serialize(%V2.Request{} = struct)) do
      V2.Request.serialize(struct)
    end

    def(api_vsn(%V2.Request{})) do
      V2.Request.api_vsn()
    end

    def(response_deserializer(%V2.Request{})) do
      V2.Request.response_deserializer()
    end
  end

  defmodule(V3.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      group_id: nil,
      generation_id: nil,
      member_id: nil,
      retention_time: nil,
      topics: [],
      correlation_id: nil,
      client_id: nil
    )

    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      3
    end

    def(response_deserializer) do
      &V3.Response.deserialize/1
    end

    def(schema) do
      [
        group_id: :string,
        generation_id: :int32,
        member_id: :string,
        retention_time: :int64,
        topics:
          {:array,
           [
             topic: :string,
             partitions: {:array, [partition: :int32, offset: :int64, metadata: :nullable_string]}
           ]}
      ]
    end

    def(serialize(%V3.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          serialize(:string, Map.fetch!(struct, :group_id)),
          serialize(:int32, Map.fetch!(struct, :generation_id)),
          serialize(:string, Map.fetch!(struct, :member_id)),
          serialize(:int64, Map.fetch!(struct, :retention_time)),
          case(Map.fetch!(struct, :topics)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :topic)),
                    case(Map.fetch!(v, :partitions)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:int32, Map.fetch!(v, :partition)),
                              serialize(:int64, Map.fetch!(v, :offset)),
                              serialize(:nullable_string, Map.fetch!(v, :metadata))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V3.Request) do
    def(serialize(%V3.Request{} = struct)) do
      V3.Request.serialize(struct)
    end

    def(api_vsn(%V3.Request{})) do
      V3.Request.api_vsn()
    end

    def(response_deserializer(%V3.Request{})) do
      V3.Request.response_deserializer()
    end
  end

  def(get_request_struct(0)) do
    %V0.Request{}
  end

  def(get_request_struct(1)) do
    %V1.Request{}
  end

  def(get_request_struct(2)) do
    %V2.Request{}
  end

  def(get_request_struct(3)) do
    %V3.Request{}
  end

  defmodule(V0.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(responses: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      0
    end

    def(schema) do
      [
        responses:
          {:array,
           [
             topic: :string,
             partition_responses: {:array, [partition: :int32, error_code: :int16]}
           ]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :responses, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:responses, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:responses, :partition_responses, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:partition_responses, :partition, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:partition_responses, :error_code, Map.put(acc, :partition, val), rest)
    end

    defp(deserialize_field(:partition_responses, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:partition_responses, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:responses, :partition_responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:partition_responses, :partition, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(
        :responses,
        nil,
        Map.put(acc, :partition_responses, Enum.reverse(vals)),
        rest
      )
    end

    defp(deserialize_field(:root, :responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:responses, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :responses, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  defmodule(V1.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(responses: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      1
    end

    def(schema) do
      [
        responses:
          {:array,
           [
             topic: :string,
             partition_responses: {:array, [partition: :int32, error_code: :int16]}
           ]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :responses, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:responses, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:responses, :partition_responses, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:partition_responses, :partition, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:partition_responses, :error_code, Map.put(acc, :partition, val), rest)
    end

    defp(deserialize_field(:partition_responses, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:partition_responses, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:responses, :partition_responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:partition_responses, :partition, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(
        :responses,
        nil,
        Map.put(acc, :partition_responses, Enum.reverse(vals)),
        rest
      )
    end

    defp(deserialize_field(:root, :responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:responses, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :responses, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  defmodule(V2.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(responses: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      2
    end

    def(schema) do
      [
        responses:
          {:array,
           [
             topic: :string,
             partition_responses: {:array, [partition: :int32, error_code: :int16]}
           ]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :responses, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:responses, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:responses, :partition_responses, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:partition_responses, :partition, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:partition_responses, :error_code, Map.put(acc, :partition, val), rest)
    end

    defp(deserialize_field(:partition_responses, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:partition_responses, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:responses, :partition_responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:partition_responses, :partition, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(
        :responses,
        nil,
        Map.put(acc, :partition_responses, Enum.reverse(vals)),
        rest
      )
    end

    defp(deserialize_field(:root, :responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:responses, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :responses, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  defmodule(V3.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(throttle_time_ms: nil, responses: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:offset_commit)
    end

    def(api_vsn) do
      3
    end

    def(schema) do
      [
        throttle_time_ms: :int32,
        responses:
          {:array,
           [
             topic: :string,
             partition_responses: {:array, [partition: :int32, error_code: :int16]}
           ]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data

      deserialize_field(
        :root,
        :throttle_time_ms,
        %__MODULE__{correlation_id: correlation_id},
        rest
      )
    end

    defp(deserialize_field(:root, :throttle_time_ms, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:root, :responses, Map.put(acc, :throttle_time_ms, val), rest)
    end

    defp(deserialize_field(:responses, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:responses, :partition_responses, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:partition_responses, :partition, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:partition_responses, :error_code, Map.put(acc, :partition, val), rest)
    end

    defp(deserialize_field(:partition_responses, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:partition_responses, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:responses, :partition_responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:partition_responses, :partition, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(
        :responses,
        nil,
        Map.put(acc, :partition_responses, Enum.reverse(vals)),
        rest
      )
    end

    defp(deserialize_field(:root, :responses, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:responses, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :responses, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  def(deserialize(0, data)) do
    V0.Response.deserialize(data)
  end

  def(deserialize(1, data)) do
    V1.Response.deserialize(data)
  end

  def(deserialize(2, data)) do
    V2.Response.deserialize(data)
  end

  def(deserialize(3, data)) do
    V3.Response.deserialize(data)
  end

  def(min_vsn) do
    0
  end

  def(max_vsn) do
    3
  end
end
