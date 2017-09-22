defmodule MongooseICE.Evaluator.Request do
  @moduledoc false

  alias Jerboa.Params
  alias MongooseICE.Evaluator
  alias MongooseICE.TURN

  @spec service(Params.t, MongooseICE.client_info, MongooseICE.UDP.server_opts, TURN.t)
    :: {Params.t, TURN.t}
  def service(params, client, server, turn_state) do
    service_(params, client, server, turn_state)
  end

  defp service_(p, client, server, turn_state) do
    handler(p).service(p, client, server, turn_state)
  end

  defp handler(params) do
    case Params.get_method(params) do
      :binding            -> Evaluator.Binding.Request
      :allocate           -> Evaluator.Allocate.Request
      :create_permission  -> Evaluator.CreatePermission.Request
      :refresh            -> Evaluator.Refresh.Request
      :channel_bind       -> Evaluator.ChannelBind.Request
    end
  end

end
