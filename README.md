# GitLab-MiLAB

Este es un conjunto de _scripts_ para montar el servicio de GitLab Community Edition
en los servidores de RedClara.

## Variables de entorno
Dependiendo si se tiene permisos de administrador, se debe cambiar la variable de entorno
`GITLAB_HOME` dentro del script `run.sh`, ya que esta variable es la que expone el camino
donde están los demás directorios necesarios para hacer funcionar el servicio.

## Directorios y caminos
Los siguientes directorios deben existir para que el _script_ funcione correctamente:
- `/srv/gitlab/`
- `/var/opt/gitlab`
- `/var/log/gitlab`

## Direcciones IP y nombres de dominio
La dirección IP debe ser modificada de acuerdo a la que está expuesta en el servidor a ser
montado, en el _script_ está como `IP_HOST`.