# Install  VectorCAST

## Prerequisite

* Install Development Tools

## Download VectorCAST

Download from [https://www.vectorcast.com/downloads](https://www.vectorcast.com/downloads)

Login

User: narethim
Email: nareth.im@ga.com

Download VectorCAST 2020 SP2 for Linux 64-bit 2020 SP2

Assuming it is downloaded to $HOME/Downloads directory

## Install VectorCAST

```sh
sudo -i

cd /usr/local
mkdir vcast
cd vcast

tar zxvf /home/<user>/Downloads/vcast.linux64.2020sp2.tar.gz .

# Set env vars
export VECTORCAST_DIR=/usr/local/vcast
export VECTOR_LICENSE_FILE=56065@emslm1

# Verify
$VECTORCAST_DIR/vcastqt --version

$VECTORCAST_DIR/manage --version
```
