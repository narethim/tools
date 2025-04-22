# Proxmox Virtual Environment Node 2 (pve2)

## Hardware

Dell OptiPlex 7050 Micro Desktop PC

* CPU: Intel Core i5-7500T 2.7GHz
* RAM: 16 GB DDR4

### Physical Disks

| Device          | Type  | Brand    | Size   |
| --------------- | ----- | -------- | ------ |
|  `/dev/nvme0n1` | NVME  | ORICO    |   1 TB |

### Partitions

| Device           | Type      | Usage     | Size    | GPT       | Model      |
| ---------------- | --------  | --------- | ------- | --------- | -----------|
|  `/dev/nvme0n1`  | nvme      | partitions| 1.02 TB | Yes       | ORICO      |
|  `/dev/nvme0n1p1`| partition | BIOS boot | 1.03 MB | Yes       |            |
|  `/dev/nvme0n1p2`| partition | EFI       | 1.07 GB | Yes       |            |
|  `/dev/nvme0n1p3`| partition | LVM       | 1.02 TB | Yes       |            |
