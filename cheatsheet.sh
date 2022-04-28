#!/bin/bash

Cheatsheet:

Particiones:
--> lsblk

2) sudo aa-status <- AppArmor status

User managment:

useradd <user>
userdel <user>
usermod -aG <group> <user>

groupadd <groupname>
groupdel <groupname>
groupmod

checks:
--> /etc/passwd
--> getent group <groupname>

SSH y UFW

check del servicio SSh --> systemctl status ssh
reinicio del servicio --> service ssh restart (root)
FILE SSH:
	/etc/ssh/sshd_config | restart tras modificar
uFw
activarlo --> ufw enable
ver status --> ufw status numbered
anadir normas --> ufw allow <norma(4242| ssh)>
eliminar normas --> ufw delete <number>


PASSWD POLICY:

FILES: 
1) /etc/pam.d/common-password --> password policy
2) /etc/login.defs --> dias de warrant

lcredit --> lowecase
ucredit --> uppercase
dcredit --> digit 
usercheck --> username not in passwd
difok --> establece el número de caracteres que deben ser diferentes de los de la
   contraseña anterior
enforce_for_root --> aplicarlo a root

*reboot de la maquina si hemos modificado algo
check para el cambio de dias --> chage -l <user>

SUDOERS:
1) sudo visudo
2) /etc/sudoers

*sudoers file*
Defautls	logfile y loginput y output para tener un trace de comandos sudo
		requiretty--> para impedir que scripts automaticos escalen privilegios

*TAMBIEN estan lo permisos otorgados a tu user + los permisos entregados al grupo sudo*
*Tambien esta la norma para que no rquiera contrasena el monitoring*

HOSTNAMECTL:
Para cambiar el nombre de la maquina usamos hostnamectl

cmd--> hostnamectl set-hostname <new_hostname>
cambiar /etc/hosts
hacer reboot

MONITORING Y CRONTAB:
--> monitoring localizacion en /usr/local/bin
--> Norma en sudoers
--> reboot
-->  sudo crontab -u root -e
-->  isudo crontab -l              <- cron schedule
--> */10 * * * * /usr/local/bin/monitoring.sh (al final)
