Vagrant-Play2-PostgreSQL
========================

Just a basic Vagrant VM I set up to run my Play Development Server over my home network.

---

###Installs

* Ubuntu Server 14.04 LTS 64bit
* Typesafe Activator 
* PostgreSQL 9.3

Default Configuration

* CPUs: 2
* Memory: 2gb

---

###Usage

SSH into the remote box using the default user name and password

     username: vagrant
     password: vagrant
    

Typesafe Activator must be ran at address `0.0.0.0` to be accessible over the home network.

    activator ui -Dhttp.address=0.0.0.0
