-module(tuple_list).
-export([]).
-include_lib("eunit/include/eunit.hrl").

example_list() ->
  [{erlang, "a functional language"}, {ruby, "an OO language"}].

tuple_list([{Lang, Description} | _Rest], Lang) -> Description;
tuple_list([{_,   _Description} |  Rest], Lang) -> tuple_list(Rest, Lang).

tuple_list_test() ->
  ?assertEqual("a functional language", tuple_list(example_list(), erlang)),
  ?assertEqual("an OO language", tuple_list(example_list(), ruby)),
  ?assertError(function_clause, tuple_list(example_list(), factor)).
