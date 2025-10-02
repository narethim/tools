# Anaconda

## Miniconda Info

### Creating environments

```sh
conda create -n <env-name>

conda create -n myenvironment python numpy pandas
```

### Listing environments

```sh
conda info --envs
# or
conda env list
```

### Deleting environment

```sh
conda env remove -n <env-name>
```

## Anaconda Info

- Go into (base) virtual environment

```sh
source ~/anaconda3/bin/activate
```

- To get out of the virtual environment anaconda-navigator

```sh
(base) $ conda deactivate
```

- Launch anaconda-navigator GUI

```sh
(base) $ anaconda-navigator
```

## Conda commands

```sh
conda --version

conda list

# envs
conda env list
```

## Documentation

- [Conda Documentation](https://docs.conda.io/en/latest/)
- [Getting started with conda](https://docs.conda.io/projects/conda/en/stable/user-guide/getting-started.html)
- [Cheatsheet](https://docs.conda.io/projects/conda/en/stable/user-guide/cheatsheet.html)
