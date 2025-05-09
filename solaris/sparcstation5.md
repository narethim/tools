# SparcStation 5

## SparcStation 5 - aladdin

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| CPU         | Sun Microsystems microSPARC 85 MHz |              |
| RAM         | 32 MB                 |              |
| HDD         | Conner 1.00 GB        |              |
| Floppy Disk | 3.5" Floppy disk      |              |
| IDPROM      | 758CCD                |              |
| OS          | Solaris 7             |              |
| Hostname    | aladdin               |              |
| User        | root                  | pwd: none    |

## SparcStation 5 - roger

| Component   | Value                 | Note         |
| ----------- | --------------------- | :----------: |
| CPU         | Sun Microsystems microSPARC 85 MHz |              |
| RAM         | 64 MB                 |              |
| HDD         | IBM 2.1 GB            |              |
| Floppy Disk | 3.5" Floppy disk      |              |
| IDPROM      |                       |              |
| OS          | Solaris 7             |              |
| Hostname    | aladdin               |              |
| User        | root                  | pwd: Testing123 |

### Set IDPROM

IDPROM is invalid

Temporary reset commands

```sh
# IDPROM - Sun MAC Address is prefixed with 08 00 20 - 13 de ad - hostid c0 ff ee

8 0 20 13 de ad c0 ff ee
```

```forth
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

Alternative method using MAC address: `8 0 20 72 fb 8e` and hostid: `72fb8e`

```forth
ok set-defaults
ok setenv diag-switch? false
ok 1  0 mkp
ok real-machine-type 1 mkp
ok 8 0 20 72 fb 8e 72fb8e mkpl <return> <ctrl-d> <ctrl-r>
ok .idprom
ok reset
```

Note: Reference YouTube video [Sun NVRAM Dead Battery Fix (idprom Contents Invalid)](https://www.youtube.com/watch?v=3lP4rXua1Lo)

## OBP command

```forth
ok probe-scsi

ok printenv boot-device
```

## References

* Fix NVRAM: [nvram-idprom-reset](nvram-idprom-reset.md)
* Info on Sun SparcStation 5: [Sun SparcStation 5](http://obsolyte.com/sun_ss5/)
