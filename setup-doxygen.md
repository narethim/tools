# Setup Doxygen

Setup doxygen with an example project

## 1. Pre-requisite 

* Doxygen installed


## 2. Create an example

```sh
mkdir -p ~/projects/doxygen-example
cd ~/projects/doxygen-example
```

### 2.1 Create configuration

```sh
cd ~/projects/doxygen-example

# Check version
doxygen --version

# Generate a configuration file
doxygen -g
```

### 2.2 Create a test file

Create a test.h file with the foolowing content:

```cpp
/**
 *  A test class. A more elaborate class description.
 */
 
class Javadoc_Test
{
  public:
 
    /** 
     * An enum.
     * More detailed enum description.
     */
 
    enum TEnum { 
          TVal1, /**< enum value TVal1. */  
          TVal2, /**< enum value TVal2. */  
          TVal3  /**< enum value TVal3. */  
         } 
       *enumPtr, /**< enum pointer. Details. */
       enumVar;  /**< enum variable. Details. */
       
      /**
       * A constructor.
       * A more elaborate description of the constructor.
       */
      Javadoc_Test();
 
      /**
       * A destructor.
       * A more elaborate description of the destructor.
       */
     ~Javadoc_Test();
    
      /**
       * a normal member taking two arguments and returning an integer value.
       * @param a an integer argument.
       * @param s a constant character pointer.
       * @see Javadoc_Test()
       * @see ~Javadoc_Test()
       * @see testMeToo()
       * @see publicVar()
       * @return The test results
       */
       int testMe(int a,const char *s);
       
      /**
       * A pure virtual member.
       * @see testMe()
       * @param c1 the first argument.
       * @param c2 the second argument.
       */
       virtual void testMeToo(char c1,char c2) = 0;
   
      /** 
       * a public variable.
       * Details.
       */
       int publicVar;
       
      /**
       * a function variable.
       * Details.
       */
       int (*handler)(int a,int b);
};
```

### 2.2 Generate the html files

```sh
# Generate html files in `html/` directory
doxygen 
```

### 2.2 View `html/index.html'

```sh
firefox html/index.html 
```