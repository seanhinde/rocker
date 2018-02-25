-module(rocker).

%% API
-export([lxcode/0,
         open/2,
         open_default/1,
         destroy/1,
         repair/1,
         path/1,
         put/3,
         get/2,
         delete/2,
         tx/2,
         iterator/2,
         iterator_valid/1,
         next/1,
         prefix_iterator/2
         ]).

%% Native library support
-export([load/0]).
-on_load(load/0).

%%==============================================================================
%% api
%%==============================================================================

lxcode() ->
    not_loaded(?LINE).

open(_Path, _Options) ->
    not_loaded(?LINE).

open_default(_Path) ->
    not_loaded(?LINE).

destroy(_Path) ->
    not_loaded(?LINE).

repair(_Path) ->
    not_loaded(?LINE).

path(_Db) ->
    not_loaded(?LINE).

put(_Db, _Key, _Value) ->
    not_loaded(?LINE).

get(_Db, _Key) ->
    not_loaded(?LINE).

delete(_Db, _Key) ->
    not_loaded(?LINE).

tx(_Db, _Operations) ->
    not_loaded(?LINE).

iterator(_Db, _Mode) ->
    not_loaded(?LINE).

iterator_valid(_Iter) ->
    not_loaded(?LINE).

next(_Iter) ->
    not_loaded(?LINE).

prefix_iterator(_Db, _Prefix) ->
    not_loaded(?LINE).


%%==============================================================================
%% helpers
%%==============================================================================

load() ->
    erlang:load_nif(filename:join(priv(), "librocker"), none).

not_loaded(Line) ->
    erlang:nif_error({error, {not_loaded, [{module, ?MODULE}, {line, Line}]}}).

priv()->
  case code:priv_dir(?MODULE) of
      {error, _} ->
          EbinDir = filename:dirname(code:which(?MODULE)),
          AppPath = filename:dirname(EbinDir),
          filename:join(AppPath, "priv");
      Path ->
          Path
  end.
