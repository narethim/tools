# setup-jenkins-vcast-plugins.md

## Install

From Jenkins menu select `Manage Jenkins` > `Manage Plugins`
Select `Availble` tab
Enter in search field: VectorCAST.
Select the following check boxes:

* [ ] VectorCAST Coverage
* [ ] VectorCAST Execution

Click on `Install without restart` button

## Setup credentials

From Jenkins menu select `Manage Jenkins`
Select `Security` > `Manage Credentials`

Click on `(global))` > `Add credentials`

```html
Kind: Username with password
Username: imnare
Password: ***
ID: <blank>
Description: bitbucket-imnare-username-password

OK
```

## Setup `Configure System` environment variables

From Jenkins menu select `Manage Jenkins`
Select `System Configuration` > `Configure System`

Scroll down to `Global proprties` section

[x] Environment variables

```html
Name: VECTOR_LICENSE_FILE
Value: 56065@emslm1

Name: VECTORCAST_DIR
Value: /usr/local/vcast
```

## `VectorCAST` Plugins

From the Dashboard select `VectorCAST`

### Create Single Job

### Create Jenkins Pipeline

Snippet Generator:

```sh
Sample Step: git: Git
   Repository URL: ssh://git@emsbitbucket.ga.com:7999/ad/asdd-ut.git
```

## References

[Git-LFS setup in Jenkins](https://medium.com/@priya_talreja/git-lfs-setup-in-jenkins-ee80879007e3)
