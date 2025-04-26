# Numerical example of $ SWDOCKP^{2} $
This repository is a computational example to demonstrate the docking efficiency of $SWDOCKP^{2}$ , includes docking 296 db2 hierarchies against four conformations of SARS-Cov-2 Main Protease (PDB: 5RFE, 5RHB, 7AR5, 7GF2).

The ligand db2 files are provided in transposed `.xz` format as described in [1]. The raw and optimized db2 (by sorting and merging confs) are named as `xaaaaaa.000.block.xz` and `xaaaaaa.000.db2.gz.opt.block.xz` respectively.

The `swdockp2_v4` and `swdockp2_v8` correspond to the four-target (`v4`) and eight-target (`v8`) version respectively. Examples are provided for both versions. If your ensemble consists of less than four conformations, the four-target version is more recommended due to its higher efficiency and less waste of memory. 


## Usage
Usage of both versions resemble each other. Here we take `swdockp2_v4` as instance.

First change to the `v4` working directory:
```bash
cd docking/v4
```
Then execute the script `run_dock.sh` to start docking, whose content is: 
```bash
ulimit -s unlimited 
export OMP_NUM_THREADS=${num_threads}
mpirun -np ${num_proc} ../../bin/swdockp2_v4
```
> The program consumes up to 4 GB of stack memory in our test examples, thus it is recommended to set `ulimit -s unlimited` to allow for more stack usage.

> ATTENTION: `${num_threads}` should be 1, 4, 16 or 64. Any number that is not to the power of 4 or larger than 64 will lead to unexpected errors. 

## Input and Output details
### Input files
Required input files in the working directory are listed as follows.

| Filename | Content |
| -------- | ------- |
| INDOCK | Docking parameters, including the path to all the energy grids and matching spheres. |
| split_database_index | Paths to all the input db2 `.xz` files. One path per line. |
| split_database_nums | Number of blocks of all the input db2 `.xz` files. One number per line, in accordance with `split_database_index`. |

## Output files
| Filename | Content |
| -------- | ------- |
| xOUTDOCK | The docking scores output by process x. |
| xmpro_rec_y.mol2.gz | The docking poses for target y output by process x. |


## Reference
