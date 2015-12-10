
OTPROOT=$(wildcard /opt/erlang/lib/erl_interface-*)

all:	bin/cnodeserver bin/cnodeclient bin/complex3.beam bin/Elixir.Complex.beam

bin/complex3.beam:	src/complex3.erl
	erlc -o bin $<

bin/Elixir.Complex.beam: src/complex.ex
	elixirc -o bin $<

bin/%:	src/%.c
	mkdir -p bin
	gcc -o $@ -I$(OTPROOT)/include -L$(OTPROOT)/lib src/complex.c $< -lerl_interface -lei -lpthread -lnsl

clean:
	rm -rf bin


start_server:
	epmd -daemon
	bin/cnodeserver 3456

start_client:
	echo "run 'complex3:foo(4).' via erlang shell"
	erl -sname e1 -setcookie secretcookie -pa bin

start_elixir:
	echo "run ':complex3.foo(4)' via elixir shell"
	iex --sname e1 --cookie secretcookie -pa bin
