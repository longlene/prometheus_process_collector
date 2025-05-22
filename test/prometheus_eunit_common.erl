-module(prometheus_eunit_common).

-export([
    start/0,
    stop/1
]).

start() ->
    prometheus:start(),
    Collectors = prometheus_registry:collectors(default),
    prometheus_registry:clear(default),
    Collectors.

stop(DefaultCollectors) ->
    prometheus_registry:clear(default),
    [prometheus_registry:register_collector(default, Collector) || Collector <- DefaultCollectors],
    ok.
