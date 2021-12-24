# Prometheus Client Library C example

## Prerequisite

* Install `docker`

## Build libraries

Clone prometheus-client-c

Note: as of 2021-12-18 there is a bug due to old `go1.13.1` issue. Replace with `go1.16.7` version.

```sh
make
```

It will generate deb pakages in `prom/` and `promhttp/`

## Install the libraries

```sh
cd prom/
sudo dpkg -i libprom-dev-0.1.3-Linux.deb

cd promhttp/
sudo dpkg -i libpromhttp-dev-0.1.3-Linux.deb

# Install microhttpd library
sudo apt install libmicrohttpd-dev
```

## Build and run example

```sh
mkdir myexample
cp example/*.c myexample
cp example/*.h myexample
cd myexample
```

Create a `makefile` using the following content

```sh
CC = gcc
CFLAGS = -Wall -I$(CURDIR) -g
OBJ = foo.o bar.o main.o

all: example

main.o:	main.c
	$(CC) -o main.o $(CFLAGS) -c main.c

foo.o:	foo.c
	$(CC) -o foo.o  $(CFLAGS) -c foo.c

bar.o:	bar.c
	$(CC) -o bar.o $(CFLAGS) -c bar.c

example: main.o foo.o bar.o
	$(CC) $(LDFLAGS) -o example main.o foo.o bar.o -pthread -lprom -lpromhttp -lmicrohttpd

clean:
	rm example *.o
```

Build it
```sh
make

./example
```

## View it from Firefox

```sh
firefox http://localhost:8000
OK

firefox http://localhost:8000/metrics
```
## References

* [Simple C Prometheus client for unusual setups](https://github.com/Keenuts/prometheus-client-c/blob/master/tests/main.cc)
* [https://digitalocean.github.io/prometheus-client-c/](https://digitalocean.github.io/prometheus-client-c/)
```
