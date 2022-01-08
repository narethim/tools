# RPC Info

## Example

### Compile example and run example

```sh
# Go to example directory
cd tutorial/step6

# Save files to temp names
mv add_client.c add_client.cc
mv add_server.c add_server.cc

# Generate code
cp ../add.x .
rpcgen -a -C add.x

# Overwrite generated code with our code
mv add_client.cc add_client.c
mv add_server.cc add_server.c

# Compile
make

# Open a new terminal
./add_server

# Open a new terminal
./add_client localhost 10 20

```

Generate code from an IDL file `add.x`

```sh
# rpcgen -a -C add.x

rpcgen -a -C add.x
```

## Tutorial

* [Introduction to programming with Sun/ONC RPC](https://people.cs.rutgers.edu/~pxk/417/notes/rpc/index.html)

## References

* [RPC Wiki](https://en.wikipedia.org/wiki/Sun_RPC)
* [Introduction to programming with Sun/ONC RPC](https://people.cs.rutgers.edu/~pxk/417/notes/rpc/index.html)
