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

## Windows Troubleshooting

If you receive errors involving `\r` (end of line):

Edit the global `.gitconfig` file, find the line:
```
autocrlf = true
```
and change it to
```
autocrlf = false
```
Remove and clone again. This will prevent windows git clients from automatically replacing unix line endings LF with windows line endings CRLF.

## Maintainers

Current maintainers:

* [Sean Watkins](https://github.com/seanlw)
