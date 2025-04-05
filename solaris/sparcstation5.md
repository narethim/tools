# SparcStation 5

## SparcStation 5 - aladdin

### HW

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| RAM         | 32 MB                 |              |
| HDD         | Conner 2.00 GB        |              |
| Floppy Disk |                       |              |
| IDPROM      | 758CCD                |              |

### SW

Solaris 7

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| aladdin     | root                  |          |

## SparcStation 5 - roger

### HW roger

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| RAM         | 32 MB                 |              |
| HDD         | IBM 2.1 GB            |              |
| Floppy Disk |                       |              |
| IDPROM      |                       |              |

### SW roger

Solaris 7

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| roger       | root                  | Testing123   |

### Set IDPROM

IDPROM is invalid

Temporary reset commands

```sh
# IDPROM - Sun MAC Address is prefixed with 08 00 20 - 13 de ad - hostid c0 ff ee

8 0 20 13 de ad c0 ff ee
```

```sh
ok set-defaults
ok setenv diag-switch? false
ok 1  0 mkp
ok 80 1 mkp or real-machine-type 1 mkp
ok 8  2 mkp
ok 0  3 mkp
ok 20 4 mkp
ok 13 5 mkp 
ok de 6 mkp 
ok ad 7 mkp 
ok 0  8 mkp 
ok 0  9 mkp 
ok 0  a mkp 
ok 0  b mkp 
ok c0 c mkp 
ok ff d mkp 
ok ee e mkp 
ok 0 f 0 do i idprom@ xor loop f mkp
reset
```

Alternative method using MAC `8 0 20 72 fb 8e` and hostid `72fb8e`

```sh
ok set-defaults
ok setenv diag-switch? false
ok 1  0 mkp
ok real-machine-type 1 mkp
ok 8 0 20 72 fb 8e 72fb8e mkpl
ok .idprom
ok probe-scsi
ok 0 f 0 do i idprom@ xor loop f mkp
reset
```
