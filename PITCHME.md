---?image=img/first_slide.png

@snap[north-west]
<h2>Introduction to PDC environment</h2>
<b>Author:</b> Henric Zazzi, PDC Center for High Performance Computing
@snapend

---

## Overview

- General information about PDC
- Infrastructure at PDC
- How to apply to PDC resources
- How to login
- File systems, permissions and transfer
- Modules
- Available software
- How to run jobs
- Compilers
- Conclusion

---

## General information about PDC

---

## SNIC Centra

@snap[east]
The Swedish National Infrastructure for Computing (SNIC) is a
national research infrastructure that provides a balanced and
cost-efficient set of resources and user support for large scale
computation and data storage to meet the needs of researchers from all
scientific disciplines and from all over Sweden (universities, university
colleges, research institutes, etc). The resources are made available
through open application procedures such that the best Swedish research is supported.
@snapend
@snap[west]
![](img/sweden.png)
@snapend

---

## PDC Offers

![](img/pdc_offers.png)

---

## PDC Key Assets: First-Line Support and System Staff

@color[green](**First-line support**)

Helps you have a smooth start to using PDC’s resources and provides assistance if
you need help while using our facilities

@color[green](**System staff: System managers/administrators**)

Ensure that PDC’s HPC and storage facilities run smoothly and securely

---

## PDC's Key Assets: HPC Application Experts

PDC-HPC application experts hold PhD degrees in different scientific fields and are experts in HPC. 
Together with researchers, they optimize, scale and enhance scientific codes for the next generation
supercomputers.

@snap[east]
![](img/thor_wikfeldt.png)

Molecular Dynamics
@snapend
![](img/henric_zazzi.png)

Bioinformatics/Molecular biology
@snap[west]
![](img/jing_gong.png)

Computational Fluid Dynamics
@snapend
@snap[southeast]
![](img/xin_li.png)

Multiscale Modelling
@snapend
@snap[south]
![](img/tor_kjellsson.png)

Code Optimization
@snapend
@snap[soutwest]
![](img/Xavier Aguilar.png)

Machine Learning/Performance Analysis
@snapend

---

## Research areas at PDC

![](img/beskow_statistics.jpeg)

**Usage of Beskow by research areas, March 2017**

---

## Infrastructure at PDC

---

## Beskow

- 32nd place on the top500 (Q4 2015)
- Fastest in Scandinavia
- Intended for very large jobs (>512 core/job)
- Allocated through SNIC
- Queue limit is 24 hours
- Runs the SLURM queue system
- Partially reserved for PRACE, SCANIA, INCF
- Lifetime: Q4 2020
  
## Tegner

- Intended for Beskow pre/post processing
- Not allocated via SNIC
- Only for academia within the Stockholm area
- Has large RAM nodes
- Has nodes with GPUs
- Runs the SLURM queue system
- Lifetime: Q4 2020  

## Summary of PDC resources

 +------------------------------------+--------------------+--------------------------+
 | Computer                           | Beskow             | Tegner                   |
 +====================================+====================+==========================+
 | Core/node                          | 32/36              | 48/24                    |
 +------------------------------------+--------------------+--------------------------+
 | Nodes                              | 2060               | | **50**: 24 Haswell/GPU |
 |                                    |                    | | **10**: 48 Ivy bridge  |
 +------------------------------------+--------------------+--------------------------+
 | RAM (Gb)                           | 64                 | | **50**: 512            |
 |                                    |                    | | **5**: 1000            |
 |                                    |                    | | **5**: 2000            | 
 +------------------------------------+--------------------+--------------------------+
 | Small allocations                  |                    | 5000                     |
 +------------------------------------+--------------------+--------------------------+
 | Medium allocations                 | 200000             | 50000                    |
 +------------------------------------+--------------------+--------------------------+
 | Large allocations                  | >200000            |                          |
 +------------------------------------+--------------------+--------------------------+
 | Allocations via SNIC               | yes                | no                       |
 +------------------------------------+--------------------+--------------------------+
 | Lifetime                           | Q4 2020            | Q4 2020                  |
 +------------------------------------+--------------------+--------------------------+
 | AFS                                | login node only    | yes                      |
 +------------------------------------+--------------------+--------------------------+
 | Lustre                             | yes                | yes                      |
 +------------------------------------+--------------------+--------------------------+

---

## How to apply for PDC resources

---

## Access to PDC resources

- User account (SUPR/PDC)
- Time allocation
  - A measure for how many jobs you can run per month (corehours/month)
  - Which clusters you can access
- Time allocation requirements
  - Can be personal or shared within a project
  - Every user must belong to at least one time allocation

---

## How to get a time allocation

- PDC resources are free for swedish academia
- You can apply for a SUPR account at
  http://supr.snic.se
- In SUPR send in a proposal for your project
- More information at
  http://www.snic.se/allocations/apply4access/

---

## How to login

---

## Kerberos

Is an authentication protocol originally developed at MIT
PDC uses kerberos together with **SSH** for login

@color[green](Ticket)
- Proof of users identity
- Users use password to obtain tickets
- Tickets are cached on users computer for a specified duration
- @color[red](Tickets should be created on your local computer)
- As long as tickets are valid there is no need to enter password

---

@color[green](Realm)
- all resources available to access
- example: NADA.KTH.SE
  
@color[green](Principal)
- Unique identity to which kerberos can assign tickets. 
- example: <username>@NADA.KTH.SE

---

## Kerberos commands

Command | Scope
--- | ---
kinit | proves your identity
klist |list your kerberos tickets
kdestroy | destroy your kerberos ticket file
kpasswd | change your kerberos password

```
$ kinit -f <username>@NADA.KTH.SE
$ klist -T

Credentials cache : FILE:/tmp/krb5cc_500
       Principal: <username>@NADA.KTH.SE
Issued       Expires     Flags  Principal
Mar 25 09:45 Mar 25 19:45 FI krbtgt/NADA.KTH.SE@NADA.KTH.SE
Mar 25 09:45 Mar 25 19:45 FA afs/pdc.kth.se@NADA.KTH.SE
```

---

## Login using kerberos tickets

1. Get a 7 days forwardable ticket on your local system
   ```
   $ kinit -f -l 7d <username>@NADA.KTH.SE
   ```
2. Forward your ticket via ssh and login
   ```
   $ ssh <username>@<cluster>.pdc.kth.se
   ```
3. Replace cluster...
   beskow login node: beskow.pdc.kth.se

4. You will have reached the cluster
   @color[red](Always create a kerberos ticket on your local system)

---

## Login from any computer


- You can reach PDC from any computer or network
- The kerberos implementation heimdal can be installed on most operating systems
  - Linux *heimdal, openssh-client*
  - Windows *Network Identity Manager, PuTTY*
  - Mac
  - KTH Computers
- Follow the instructions for your operating system
  https://www.pdc.kth.se/support/documents/login/login.html

---

## KTH Computers

The same commands, aka *kinit* *klist* *ssh*, kan be used
on KTH computers but must be preceeded by **pdc-**

```
# Get a ticket
$ pdc-kinit -f -l 7d <username>@NADA.KTH.SE
# Login into cluster  
$ pdc-ssh <cluster>.pdc.kth.se
```

More information at
https://www.pdc.kth.se/support/documents/login/kth_ubuntu_login.html

---

## File systems, permissions and transfer

---

## File systems at PDC

- AFS (Andrew File System)
  - distributed
  - global
  - backup
- Lustre (Linux cluster file system)
  - distributed
  - high-performance
  - no backup
  
---

## AFS

- Andrew File System
- Named after the Andrew Project (Carnegie Mellon University)
- Distributed file system
- Security and scalability
- Accessible "everywhere" (remember that when you make your files
  readable/writeable!)
- Not available on Beskow compute nodes
- Access via Kerberos tickets and AFS tokens

---

- Your PDC home directory is located in AFS, example:
  ```
  /afs/pdc.kth.se/home/u/user
  ```  
- OldFiles mountpoint (created by default) contains a snapshot of the files
  as they were precisely before the last nightly backup was taken.
  ```
  /afs/pdc.kth.se/home/u/user/OldFiles
  ```
- By default you get a limited quota (5 GB)

---

## Lustre

- Parallel distributed file system
- Large-scale cluster computing
- High-performance
  ```
  /cfs/klemming
  ```
- UNIX permissions
- No personal quota. :red:`Move your data when finished`
- Not global

---

- Always start and run your programs in lustre if possible
- Default home directory:
  ```
  # Not backed up
  /cfs/klemming/nobackup/[username 1st letter]/[username]
  # Files older than 30 days will be deleted
  /cfs/klemming/scratch/[username 1st letter]/[username]
  ```

---

## File transfer between PDC machines

- /afs is mounted and visible on all machines (at least on login node)
- No need to "transfer" files which are on /afs
- You can share files between machines via /afs

---

## How to install AFS

Install AFS client and copy directly
then AFS is mounted just like another disk on your computer

https://www.pdc.kth.se/support/documents/managing_files/file_transfer_afs.html
   
---

## scp, an alternative for AFS

```
# from my laptop to Beskow
$ scp myfile <username>@beskow.pdc.kth.se:~/Private
# from Beskow Lustre to my laptop
$ scp <username>@beskow.pdc.kth.se:/cfs/klemming/scratch/<u>/<username>/file.txt .
```
  
*If the username is the same on source and destination machine, you can
leave it out*

For large files use the transfer nodes on Tegner

@color[green](t04n27.pdc.kth.se, t04n28.pdc.kth.se)
  
```
# from my laptop to klemming  
$ scp file.txt user@t04n27.pdc.kth.se:/cfs/klemming/scratch/<u>/<username>
```

---

## Modules

---

## What are Modules

Used to load a specific software, and versions, into your environment

---

## What modules do

```
$ module show fftw/3.3.4.0
-------------------------------------------------------------------
/opt/cray/modulefiles/fftw/3.3.4.0:

setenv		 FFTW_VERSION 3.3.4.0 
setenv		 CRAY_FFTW_VERSION 3.3.4.0 
setenv		 FFTW_DIR /opt/fftw/3.3.4.0/haswell/lib 
setenv		 FFTW_INC /opt/fftw/3.3.4.0/haswell/include 
prepend-path	 PATH /opt/fftw/3.3.4.0/haswell/bin 
prepend-path	 MANPATH /opt/fftw/3.3.4.0/share/man 
prepend-path	 CRAY_LD_LIBRARY_PATH /opt/fftw/3.3.4.0/haswell/lib 
setenv		 PE_FFTW_REQUIRED_PRODUCTS PE_MPICH 
prepend-path	 PE_PKGCONFIG_PRODUCTS PE_FFTW 
setenv		 PE_FFTW_TARGET_interlagos interlagos 
setenv		 PE_FFTW_TARGET_sandybridge sandybridge 
setenv		 PE_FFTW_TARGET_x86_64 x86_64 
setenv		 PE_FFTW_TARGET_haswell haswell 
setenv		 PE_FFTW_VOLATILE_PKGCONFIG_PATH /opt/fftw/3.3.4.0/@PE_FFTW_TARGET@/lib/pkgconfig 
prepend-path	 PE_PKGCONFIG_LIBS fftw3f_mpi:fftw3f_threads:fftw3f:fftw3_mpi:fftw3_threads:fftw3 
module-whatis	 FFTW 3.3.4.0 - Fastest Fourier Transform in the West 
-------------------------------------------------------------------
```

---

## Module commands

Command | Scope
--- | ---
module add *software[/version]* | loads *software[/version]*
module avail | Lists available softwares
module show *software* | shows information about *software*
module list | Lists currently loaded softwares
module swap *frommodule* *tomodule* | swaps *frommodule* to *tomodule*

---

## Available software

On our cluster, we have already installed a number of software with
their different versions.

More information about the software, how they were installed and how to run them at PDC is available at
https://www.pdc.kth.se/software
   
---

## How to run jobs

---

## SLURM queue system

1. Allocates exclusive and/or non-exclusive access to resources (computer nodes) to users for some duration of time so they can perform work.
2. Provides a framework for starting, executing, and monitoring work (typically a parallel job) on a set of allocated nodes.
3. Arbitrates contention for resources by managing a queue of pending work
4. Installed on Beskow, Tegner
5. Installed by default, no need to load module

---

## Which time allocation am I a member of

Projinfo::

```
$ projinfo -h
Usage: projinfo [-u <username>] [-c <clustername>] [-a] [-o]
-u [user] : print information about specific user
-o : print information about all (old) projects, not just current
-c [cluster] : only print allocations on specific cluster
-a : Only print membership in projects
-d : Usage by all project members
-p [DNR] : only print information about this project
-h : prints this help
```

Statistics are also available at...
https://www-local.pdc.kth.se/software/cluster_usage/
   
---

## Course Allocation


Allocation

@color[green](edu19.bioexcel)

---

## Using salloc

- To run interactively (reservation is optional)
  ```   
  $ salloc -A <allocation> -t <min> [--reservation=<reservation>]
  $ mpirun -A <allocation> -n <cores> [-N <nodes] ./MyPrgm
  $ mpirun -A <allocation> -n <cores> [-N <nodes] ./MyPrgm
  $ exit
  ```

- To login into reserved node after salloc
  ```
  $ echo $SLURM_NODELIST
  # From your local computer
  $ ssh <nodename>.pdc.kth.se
  ```

- To book and execute on a dedicated node
  ```
  $ salloc -t <min> -N <nodes> -A <allocation> mpirun -n cores ./MyPrgm
  ```

---

## Requesting a specific type of node

It is also possible in SLURM to request a specific type of node, 
e.g. if there is a mix of large or small memory nodes e.g.
```
# Request a node with at least 1 TB RAM
salloc -t 1:00:00  -A <allocation> -N 1 --mem=1000000
# Request a node with at least 24 logical CPUs
salloc  -A <allocation> -N 1 -t 300 --mincpus=24
# Request a node with a K80 GPU
salloc  -A <allocation> --gres=gpu:K80:2
```
  
If the cluster does not have enough nodes of that type then the request will fail with an error message.

---

## Using sbatch

```
$ sbatch <script>
```

```
#!/bin/bash -l
#SBATCH -J myjob
# Defined the time allocation you use
#SBATCH -A <allocation>
# 10 minute  wall-clock time will be given to this job
#SBATCH -t 10:00
# Number of nodes
#SBATCH --nodes=2
# set tasks per node to 24 to disable hyperthreading
#SBATCH --ntasks-per-node=24
# load intel compiler and mpi
module load i-compilers intelmpi
# Run program 
mpirun -n 48 ./hello_mpi
```

---

## Other SLURM commands

- To remove a submitted job
  ```
  $ scancel jobid
  ```

* Show my running jobs
  ```
  $ squeue [-u <username>]
  ```

---

## Compilers

---

## Compilers and libraries on Beskow

- PrgEnv module
  - PrgEnv-cray, PrgEnv-Intel (Intel), PrgEnv-gnu (GNU)
  - By default **PrgEnv-cray** is loaded
  - Swap it by using command...
    ```
    $ module swap PrgEnv-cray PrgEnv-other
    ```
- Always use the wrappers

  - cc (C code), CC (C++), ftn (FORTRAN)
      
---
   
- Wrappers automatically link with math libraries if their modules are loaded
  ```
  $ module load cray-libsci fftw
  ```
  - Other libraries are lapack, blas scalapack, blacs,...
  -  https://www.pdc.kth.se/software/#libraries

## Using compiler wrappers on Beskow (serial and MPI)

```
# Fortran
ftn [flags] source.f90
# C
cc [flags] source.c
# C++
CC [flags] source.cpp
```

---

## Comping OpenMP code on a Beskow

```
# Intel
ftn -openmp source.f90
cc -openmp source.c
CC -openmp source.cpp
# Cray
ftn -h omp source.f90
cc -h omp source.c
CC -h omp source.cpp
# GNU
ftn -fopenmp source.f90
cc -fopenmp source.c
CC -fopenmp source.cpp
```

---

## Compiling serial code on Tegner

```
# GNU
$ gfortran -o hello hello.f
$ gcc -o hello hello.c
$ g++ -o hello hello.cpp
# Intel
$ module add i-compilers
$ ifort -FR -o hello hello.f
$ icc -o hello hello.c
$ icpc -o hello hello.cpp
```

---

Compiling MPI/OpenMP code on Tegner
-----------------------------------

```
# GNU
$ module add gcc/5.1 openmpi/1.8-gcc-5.1 
$ mpif90 -FR -fopenmp -o hello_mpi hello_mpi.f
$ mpicc -fopenmp -o hello_mpi hello_mpi.c
$ mpic++ -fopenmp -o hello_mpi hello_mpi.cpp
# Intel
$ module add i-compilers intelmpi
$ mpiifort -openmp -o hello.f90 -o hello_mpi
$ mpiicc -openmp -o hello_mpi hello_mpi.c
$ mpiicpc  -openmp -o hello_mpi hello_mpi.cpp
```

---

## Conclusion

---

## PDC support


- A lot of question can be answered via our web
  http://www.pdc.kth.se/support

-  The best way to contact us is via e-mail
   https://www.pdc.kth.se/support/documents/contact/contact_support.html

- The support request will be tracked
- Use a descriptive subject in your email
- Give your PDC user name.
- Provide all necessary information to reproduce the problem.
- For follow ups always reply to our emails

---


























## Overview

- What are containers
- Docker, the most popular container
- Singularity: Containers for the HPC environment
- installation of singularity
- Using the container
- How to build containers
- Running your container in an HPC environment
- Creating recipes for singularity

---

## What are containers

![borderless](img/container.png)
---

@snap[north-west]
A container image is a lightweight, standalone, executable package of
software that includes everything needed to run an application.
@snapend

@snap[south-west size40 border-image]
Virtual Machine<br>
![](img/container-vm-whatcontainer.png)
@snapend

@snap[south-east size40 border-image align-left]
Container<br>
![](img/container-what-is-container.png)
@snapend

---

## Containers: How are they useful

- Reproducibility
- Portability
- Depending on application and use-case, simple extreme scalability
- Next logical progession from virtual machines

---

## Why do we want containers in HPC?

- Escape “dependency hell”
- Load fewer modules
- Local and remote code works identically every time
- One file contains everything and can be moved anywhere

---

## Docker, the most popular container

![](img/docker.png)

---

## The Docker container software

- The most know and utilized container software
- Facilites workflow for creating, maintaining and distributing software
- Easy to install, well documented, standardized
- Used by many scientist

---

## Docker on HPC: The problem

- Incompabilities with scheduling managers (SLURM...)
- No support for MPI
- No native GPU support
- Docker users can escalate to root access on the cluster
- @color[red](Not allowed on HPC clusters)

---

## Singularity: Containers for the HPC environment

- Package software and dependencies in one file
- Use same container in different SNIC clusters
- Limits user’s	privileges,	better security
- Same user inside container as on host
- No need for most modules
- **Negligable performance decrease**

---

## But I want to keep using docker

- Works great for local and private resources.
- No HPC centra will install docker for you
- **Singularity can import Docker images**

---

## Singularity hub

https://singularity-hub.org/
@snap[with-border]
![](img/hub.png)
@snapend

---

## Singularity Versions

- Latest version: 3.0.0 (2018-10-08)
- Installed on Tegner: 2.5.1
- Installed on VM: 2.5.2

---

@snap[north-west]
<h2>Singularity workflow</h2>
@snapend

@snap[west with-border]
**Local computer**<br>
**(ROOT)**<br>
Create container<br>
@css[lightgreen](singularity build)<br>
Install software<br>
Install libraries<br>
@snapend

@snap[kthblue]
@fa[arrow-right fa-4x]
@snapend

@snap[east align-left with-border]
**HPC cluster**<br>
**(USER)**<br>
@css[lightgreen](singularity shell)<br>
@css[lightgreen](singularity exec)<br>
@css[lightgreen](singularity help)<br>
@css[lightgreen](singularity run)<br>
@snapend

---

## Install singularity in Linux

```
$ VERSION=2.5.2
$ sudo apt-get update
$ sudo apt-get install libarchive-dev
$ sudo apt-get install squashfs-tools
# Get and install
$ wget github.com/sylabs/singularity/releases/
download/$VERSION/singularity-$VERSION.tar.gz
$ tar xvf singularity-$VERSION.tar.gz
$ cd singularity-$VERSION
$ ./configure --prefix=/usr/local
$ make
$ sudo make install
```

For Mac or Windows, follow instructions at https://www.sylabs.io/guides/2.6/user-guide/installation.html

---

## Launching a container

- Singularity sets up the container environment and creates the necessary
  namespaces.
- Directories, files and other resources are shared from the host into the
  container.
- All expected I/O is passed through the container: pipes, program arguments,
  std, X11
- When the application(s) finish their foreground execution process, the
  container and namespaces collapse and vanish cleanly

---

## Using the container

---

## Download and test an image

Download and test the latest UBUNTU image from docker hub

```
$ sudo singularity build my_image.simg docker://ubuntu:latest
Docker image path: index.docker.io/library/ubuntu:latest
Cache folder set to /root/.singularity/docker
Importing: base Singularity environment
Building Singularity image...
Singularity container built: my_image.simg
$ singularity shell my_image.simg
Singularity: Invoking an interactive shell within container...
Singularity my_image.simg:~> cat /etc/*-release

```

@snap[align-right]
@color[red](Do it yourself:)
@snapend

---

## @color[red](Exercise 1: Download a container)

@ol[](false)
- Go to singularity hub and find the hello-world container (https://singularity-hub.org/collections)
- build the container using singularity
  (shub://[full name of container])
- Use the container shell and get acquainted with it 
@olend

---

## How to build containers

---

## Why must I be root?

Same permissions in the container as outside...

To be root in the singularity image you must be root on the computer

---

## Build a writeable image

Since there are memory limitation on writing directly to image file,
it is better to create a sandbox

```
$ sudo singularity build --sandbox my_sandbox my_image.simg
Building from local image: my_image.simg
Singularity container built: my_sandbox
$ sudo singularity shell -w my_sandbox
Singularity: Invoking an interactive shell within container...
Singularity my_sandbox:~>
```

---

## How do I execute commands in singularity

Commands in the container can be given as normal.

```
singularity exec my_image.simg ls
```
```
$ singularity shell my_image.simg
Singularity: Invoking an interactive shell within container...
Singularity my_image.simg:~> ls
```

---

## Transfer files into container

**Read mode:** You can read/write to file system outside container and
read inside container.

**write mode:** You can read/write inside container.

@color[darkgreen](**Remember:** In write mode you are user ROOT, home folder: /root)

---

## How to transfer files into the container

```
$ sudo singularity exec -w my_sandbox mkdir singularity_folder
$ sudo singularity shell -B my_folder:/root/singularity_folder -w my_sandbox
Singularity my_sandbox:~> cp singularity_folder/file1 .
```
@snap[align-right]
@color[red](Do it yourself:)
@snapend

---

## @color[red](Exercise 2: Create your own container)

@ul[](false)
- Go to docker hub and find the official latest ubuntu
- build the container using singularity
- Build a writeable sandbox
- Install necessary tools into the container (Compiler etc...)
  - apt-get update
  - apt-get install build-essential
@ulend

---

## singularity.d folder

Startup scripts etc... for your singularity image

```
$ singularity exec my_image.simg ls -l /.singularity.d
total 1
drwxr-xr-x 2 root root  76 Sep 11 17:05 actions
drwxr-xr-x 2 root root 139 Sep 11 17:23 env
drwxr-xr-x 2 root root   3 Sep 11 17:05 libs
-rwxr-xr-x 1 root root  33 Sep 11 17:23 runscript
-rwxr-xr-x 1 root root  10 Sep 11 17:05 runscript.help
```

@color[darkgreen](**Important:** The files must be executable and owned by root)

---

## Creating a script

@snap[align-left]
runscript
@snapend

```
#!/bin/sh

ls -l
```
@snap[align-left]
command
@snapend
```
$ singularity run my_image.simg
total 1
drwxr-xr-x 2 root root  76 Sep 11 17:05 file1
drwxr-xr-x 2 root root 139 Sep 11 17:23 file2
```

---

## What is a help file and how is it used

@snap[align-left]
runscript.help
@snapend

```
This is a text file
```
@snap[align-left]
command
@snapend
```
$ singularity help my_image.simg
This is a text file
```

---

## Build a new container from a sandbox

```
$ sudo singularity build my_new_image.simg my_sandbox
Building image from sandbox: my_sandbox
Building Singularity image...
Singularity container built: my_new_image.simg
Cleaning up...
```

@snap[align-right]
@color[red](Do it yourself:)
@snapend

---

## @color[red](Exercise 3: Edit your own container)

@ol[](false)
- Create a help file
- Create/Edit the runscript running hello world
- Create a new container from the sandbox
@olend

@color[darkgreen](**Tip:** You can use the editor in your VM and then transfer the file)

---

## Running your container in an HPC environment

---

## Requirements

- OpenMPI version must be the same in container and cluster
- Compiler and version must be the same in container and cluster
- You need to bind to the LUSTRE file system at PDC so it can be detected

---

## What are the required tools

wget, build-essential, lzip, m4, libgfortran3, gmp, mpfr, mpc,
zlib, gcc, openmpi, cmake, python, cuda

- On AFS
  - /afs/pdc.kth.se/pdc/vol/singularity/2.5.1/shub.backup
- On Lustre
  - /cfs/klemming/pdc.vol.tegner/singularity/2.4.2/shub
- **Image:** ubuntu-16.04.3-gcc-basic.simg
- https://www.pdc.kth.se/software

---

## Send in a singularity batch job and execute

```
#!/bin/bash -l
#SBATCH -J myjob
#SBATCH -A edu18.prace
#SBATCH --reservation=prace-2018-10-25
#SBATCH -t 1:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH -o output_file.o
module add gcc/6.2.0 openmpi/3.0-gcc-6.2 singularity
mpirun -n 8 singularity exec -B /cfs/klemming hello_world.simg hello_world_mpi
```

@snap[align-right]
@color[red](Do it yourself:)
@snapend

---

## @color[red](Exercise 4: Run a HPC container)

@ol[](false)
- Login into tegner.pdc.kth.se
- send in a job for the hello-world image
  - Use the hello_world image on PDCs singularity repository
@olend

@color[darkgreen](**Tip:** With the singularity module use the **Path:** $PDC_SHUB)

---

## How about GPUs?

**Flag:** --nv

Finds the relevant nVidia/CUDA libraries on your host.
 
```
salloc -t <time> -A edu18.prace --gres=gpu:K420:1
srun -N 1 singularity exec --nv -B /cfs/klemming cuda.simg cuda_device
Device Number: 0
  Device name: Quadro K420
  Memory Clock Rate (KHz): 891000
  Memory Bus Width (bits): 128
  Peak Memory Bandwidth (GB/s): 28.512000
```

---

## Creating recipes for singularity

---

## Singularity Recipes

A Singularity Recipe is the driver of a custom build, and the starting point
for designing any custom container. It includes specifics about installation
software, environment variables, files to add, and container metadata

---

## How to build from a recipe

A recipe is a textfile explaining what should be put into the container

```
sudo singularity build my_image.simg my_recipe
```

---

## Recipe format

```
# Header
Bootstrap: docker
From: ubuntu:latest
# Sections
%help
  Help me. I'm in the container.
%files
    mydata.txt /home
%post
    apt-get -y update
    apt-get install -y build-essential
%runscript
    echo "This is my runscript"
```

---

## Header

What image should we start with?

- *Bootstrap:*
  - shub
  - docker
  - localimage
- *From:*
  - The name of the container
```
# Header
Bootstrap: docker
From: ubuntu:latest
```

---

## Section: %help

Some information about your container.
Valuable to put information about what software and versions
are available in the container

```
%help
  This container is based on UBUNTU 16.04. GCC v6.2 installed
```

---

## Section: %post

What softwares should be installed in my container.

```
%post
    apt-get -y update
    apt-get install -y build-essential
```

@snap[align-left]
@color[darkgreen](No interaction in the scripts)<br>
@color[darkgreen](We do not need sudo in the container)
@snapend

---

## Section: %files

What local files should be copied into my container

```
%files
    # <filename> <singularity path>
    myfile.txt /opt
```

---

## Section: %runscript

What should be executed with the run command.

```
%runscript
    mysoftware -param1 -param2
    
```

@snap[align-right]
@color[red](Do it yourself:)
@snapend

---

## @color[red](Exercise 5: Create a recipe)

@ol[](false)
- Based on UBUNTU
- Install compilers
- Create a help text
- Create a runscript
- Run the recipe
@olend

@color[darkgreen](**Tip:** You can use the editor in your VM and then transfer the file)

---

## Useful links

- https://www.pdc.kth.se/software/software/singularity/
- https://www.sylabs.io/guides/2.6/user-guide/
- https://gitpitch.com/PDC-support/singularity-introduction#/
