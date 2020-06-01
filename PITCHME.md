---?image=img/first_slide.png

@snap[north-west]
<h2>Introduction to PDC</h2>
<b>Author:</b> Henric Zazzi, PDC Center for High Performance Computing
@snapend

---

@snap[north-west span-45 text-left text-06]
<h2>SNIC Centra</h2>
The Swedish National Infrastructure for Computing (SNIC) is a
national research infrastructure that provides a balanced and
cost-efficient set of resources and user support for large scale
computation and data storage to meet the needs of researchers from all
scientific disciplines and from all over Sweden (universities, university
colleges, research institutes, etc). The resources are made available
through open application procedures such that the best Swedish research is supported.
@snapend
@snap[north-east borderless span-45]
![](img/sweden.png)
@snapend

---

## PDC Offers

![](img/pdc_offers.png)

---

## Broad range of training

- PDC Summer School every year: Introduction to HPC
- Specific courses: Programming with GPGPU, Recent Advances in Distributed and Parallel Computing, Software Development Tools, Recent Advances in Cloud Computing, and many many more….
- PDC user days, PDC Open House and Pub Afternoon

---

## PDC Key Assets: First-Line Support and System Staff

@color[green](**First-line support**)

Helps you have a smooth start to using PDC’s resources and provides assistance if
you need help while using our facilities

@color[green](**System staff: System managers/administrators**)

Ensure that PDC’s HPC and storage facilities run smoothly and securely

---

## HPC Application Experts

PDC-HPC application experts hold PhD degrees in different scientific fields and are experts in HPC. 
Together with researchers, they optimize, scale and enhance scientific codes for the next generation
supercomputers.

| Name | Area |
| --- | --- |
| Henric Zazzi | Bioinformatics/Genetics |
| Thor Wikfeldt | Molecular dynamics |
| Jing Gong | CFD |
| Tor Kjellström | Computational physics |
| Xin Li | Electronic structure |
| Xavi Aguilar | Code optimization/AI |

---

## Research areas at PDC

![](img/beskow_statistics.jpeg)

**Usage of Beskow by research areas, March 2017**

---

## Infrastructure at PDC

---

## Beskow

- 32nd place on the top500 (Q4 2015)
- 2nd fastest in Scandinavia
- Intended for very large jobs (>128 core/job)
- Allocated through SNIC
- Queue limit is 24 hours
- Runs the SLURM queue system
- Partially reserved for PRACE, SCANIA, INCF
- Lifetime: Q4 2020
  
---  
  
## Tegner

- Intended for Beskow pre/post processing
- Not allocated via SNIC
- Only for academia within the Stockholm area
- Has large RAM nodes
- Has nodes with GPUs
- Runs the SLURM queue system
- Lifetime: Q4 2020  

---

## Summary of PDC resources

| Computer | Beskow | Tegner |
| --- | --- | --- |
| Core/node | 32/36 | 48/24 |
| Nodes | 2060 | **50**: 24 Haswell/GPU |
| ... |  | **10**: 48 Ivy bridge |
| RAM (Gb) | 64/128 | **50**: 512 |
| ... |  | **5**: 1000 |
| ... |  | **5**: 2000 |
| Small allocations | 5000 |   |
| Medium allocations | 200000 | 50000  |
| Large allocations | >200000 |  |
| Allocations via SNIC | yes | no  |
| Lifetime | Q4 2020 | Q4 2020 |
| AFS | login node only | yes |
| Lustre | yes | yes |

---


## File systems, permissions and transfer

---

## File systems at PDC

- AFS *Andrew File System*
  - distributed
  - global
  - backup
- Lustre *Linux cluster file system*
  - distributed
  - high-performance
  - no backup
  
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

## Apply to a SUPR account

- Needed to be added or apply to a time allocation
- You can apply for a SUPR account at http://supr.snic.se
- Apply for a PDC account via SUPR to Link your SUPR account

---

## Apply to a PDC account for courses

- Electronic copy of your passport
- Examine the computer rules at PDC
- Which postal address the password should be sent
- Which time allocations/course the users will access

---

## Time allocations

@snap[text-06 with-border]
**Small allocation**<br>
Applicant can be a PhD student or higher<br>
Evaluated on a technical level only<br>
Limits is usually 5000 corehours/month<br>
@snapend

@snap[text-06 with-border]
**Medium allocation**<br>
Applicant must be a senior scientist in swedish academia<br>
Evaluated on a technical level only<br>
Limits depend on machine<br>
On large clusters: 200 kcorehours/month<br>
@snapend	

@snap[text-06 with-border]
**Large allocation**<br>
Applicant must be a senior scientist in swedish academia<br>
Need evidence of successful work at a medium level<br>
Evaluated on a technical and scientific level<br>
Proposal evaluated by SNAC twice a year<br>
No formal limits<br>
@snapend

---

## Use of resources

- All resources are free of charge for Swedish academia
- Please acknowledge SNIC/PDC when using these resources.

@snap[text-06 with-border]
The computations/simulations/[SIMILAR] were performed on resources
provided by the Swedish National Infrastructure for Computing (SNIC) at [CENTERNAME (CENTER-ACRONYME)]. 
@snapend

- Acknowledge them or include them in article if somebody has contributed 
  
@color[red](Acknowledgement will be taken into consideration when applying for new resources.)

---

## Modules

---

## What are Modules

Used to load a specific software, and versions, into your environment

---

## Available software

On our cluster, we have already installed a number of software with
their different versions.

More information about the software, how they were installed and how to run them at PDC is available at
https://www.pdc.kth.se/software
   
---

## SLURM queue system

1. Allocates exclusive access to resources (computer nodes) to users for some duration of time.
2. Provides a framework for starting, executing, and monitoring work on a set of allocated nodes.
3. Arbitrates contention for resources by managing a queue of pending work
4. Installed on Beskow, Tegner
5. Installed by default, no need to load module

---

## Which time allocation am I a member of

Projinfo

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

@css[text-06](Statistics are also available at https://pdc-web-01.csc.kth.se/cluster_usage/)
   
---

## PDC support


- A lot of question can be answered via our web
  @css[text-06](http://www.pdc.kth.se/support)
-  The best way to contact us is via e-mail
   @css[text-06](https://www.pdc.kth.se/support/documents/contact/contact_support.html)
- The support request will be tracked
- Use a descriptive subject in your email
- Give your PDC user name.
- Provide all necessary information to reproduce the problem.

---

This presentation is available at 

@css[text-06](https://gitpitch.com/PDC-support/introduction-to-pdc/outreach)
