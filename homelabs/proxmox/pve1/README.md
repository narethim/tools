# Proxmox Virtual Envienment Node 1 (pve1)

## Hardware

Dell R620

### PERC H710 Mini RAID Controller

| V Disk| Name     | RAID Type | Size    | Status    | Device     |
| ----- | -------  | --------- | ------- | --------- | -----------|
|  0    | bootdisk | RAID0     | 74 GB   | Ready     | `/dev/sda` |
|  1    | vdisk1   | RAID0     | 1,116 GB| Ready     | `/dev/sdb` |
|  2    | vdisk2   | RAID0     | 558 GB  | Ready     | `/dev/sdc` |
|  3    | vdisk3   | RAID0     | 558 GB  | Ready     | `/dev/sdd` |
|  4    | vdisk4   | RAID0     | 465 GB  | Ready     | `/dev/sde` |
|  5    | vdisk5   | RAID0     | 465 GB  | Ready     | `/dev/sdf` |
|  6    | vdisk6   | RAID0     | 931 GB  | Ready     | `/dev/sdg` |
|  7    | vdisk7   | RAID0     | 931 GB  | Ready     | `/dev/sdh` |

### Physical Disks

| Slot  | Type  | Brand    | Size   | V Disk    | Device     |
| ----- | ----- | -------- | ------ | --------- | -----------|
|  00   | SAS   | IBM      | 600 GB | vdisk1    | `/dev/sdb` |
|  01   | SAS   | IBM      | 600 GB | vdisk1    | `/dev/sdb` |
|  02   | SAS   | DELL     | 600 GB | vdisk2    | `/dev/sdc` |
|  03   | SAS   | DELL     | 600 GB | vdisk3    | `/dev/sdd` |
|  04   | SATA  | WD Black | 465 GB | vdisk4    | `/dev/sde` |
|  05   | SATA  | WD Black | 465 GB | vdisk5    | `/dev/sdf` |
|  06   | SATA  | DELL     | 1 TB   | vdisk6    | `/dev/sdg` |
|  07   | SATA  | DELL     | 1 TB   | vdisk7    | `/dev/sdh` |
|  08   |       |          |        |           |            |
|  09   | SATA  | WD Black | 931 GB | bootdisk  | `/dev/sda` |
