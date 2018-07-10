# ArchivesSpace
ArchivesSpace vagrant box

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/seanlw/archivesspace-vagrant.git`
2. `cd archivesspace-vagrant`
3. `vagrant up`
4. Staff Interface [http://localhost:8080](http://localhost:8080)
5. Public Interface [http://localhost:8081](http://localhost:8081)
5. Backend [http://localhost:8089](http://localhost:8089)

## Environment

* Ubuntu 16.04 64-bit machine with:
  * [MySQL](https://www.mysql.com/)
    * username = "root", password = "root"
    * ArchivesSpace db = "aspace", username = "aspace", password = "aspace"

## Maintainers

Current maintainers:

* [Sean Watkins](https://github.com/seanlw)
