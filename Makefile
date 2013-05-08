
OPTROOT=/usr/lib/erlang/lib/erl_interface-*

all:	bin/cnodeserver bin/cnodeclient bin/complex3.beam

bin/%.beam:	src/%.erl
	erlc -o bin $<

bin/%:	src/%.c
	mkdir -p bin
	gcc -o $@ -I$(OPTROOT)/include -L$(OPTROOT)/lib src/complex.c $< -lerl_interface -lei -lpthread -lnsl

clean:
	rm -rf bin


start_server:
	bin/cnodeserver 3456

start_client:
	echo "run 'complex3:foo(4).' via erlang shell"
	erl -sname e1 -setcookie secretcookie -pa bin
