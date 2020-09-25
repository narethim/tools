
# Install Google Test

## Prerequisite

* Install Development Tools
* Install CMake

## Install CMake

For Ubuntu

```sh
# install development tools
sudo apt-get install build-essential

# install cmake
sudo apt-get install cmake
```

## Install Google Test (gtest)

For Ubuntu

Use this blog [link](https://www.eriksmistad.no/getting-started-with-google-test-on-ubuntu/) as guide.

```sh
# install gtest
sudo apt  install libgtest-dev

# build gtest
cd /usr/src/gtest
mkdir build
cd build
sudo cmake ..
sudo make

# Install gtest
sudo make install
```

## Resources

* [Google Test on GitHub](https://github.com/google/googletest)
* [Getting started with Google Test (GTest) on Ubuntu](https://www.eriksmistad.no/getting-started-with-google-test-on-ubuntu/)
* [How To Install/Use Google C++ Test Framework - Ubuntu](https://www.srcmake.com/home/google-cpp-test-framework)
* [How to set up googletest library from source](https://lchsk.com/how-to-set-up-googletest-library-from-source.html)
* [Installing GoogleTest (Unit Test Framework for C++)](https://cit.dixie.edu/faculty/larsen/google-test-installation.php)
