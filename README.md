# density.io - homework - build and deploy app on nomad

task: <https://github.com/DensityCo/devops-homework>

## install nomad

---

### sync machine time (if necesasry)

sudo ntpdate ntp.ubuntu.com

### add gpg key

curl -fsSL <https://apt.releases.hashicorp.com/gpg> | sudo apt-key add -D

### add hashicorp repo

sudo apt-add-repository "deb [arch=amd64] <https://apt.releases.hashicorp.com> $(lsb_release -cs) main"

### update and install

sudo apt-get update && sudo apt-get install nomad

### check install

nomad

### start dev agent/serve mode for nomad

sudo nomad agent -dev

## Commands

---
see commands.txt in nomad/

## Links

---
jobspec example: <https://www.nomadproject.io/docs/job-specification>
docker driver: <https://www.nomadproject.io/docs/drivers/docker>

Notes:
connect (group services/tasks) example jobspec (don't need but good to know and see): <https://www.nomadproject.io/docs/job-specification/connect>

know how to set up the DB
How would you connect db to flask?
What about updates? read/write replicas?

* Jobs are the primary configuration that users interact with when using Nomad. A job is a declarative specification of tasks that Nomad should run. Jobs have a globally unique name, one or many task groups, which are themselves collections of one or many tasks.
* Each Job has a specification called a jobspec written in HCL.
* Job > Groups > Tasks
* Each job file has only a single job, however a job may have multiple groups, and each group may have multiple tasks.
* Groups contain a set of tasks that are co-located on a machine.
