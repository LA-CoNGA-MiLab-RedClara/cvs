# La variable de entorno para GitLab,
# será para montar al contenedor, pero hay que modificarla de acuerdo
# a los permisos en el servidor
GITLAB_HOME=$HOME/gitlab-test/srv/gitlab

# * IP y hostname
HOST_NAME="ilabproy.redclara.net"
IP_HOST=201.159.223.183

# * Puertos
HTTP_PORT=80
HTTPS_PORT=443

# * Volumenes
CONFIG=$GITLAB_HOME/config
LOGS=$GITLAB_HOME/logs
DATA=$GITLAB_HOME/data

# * Imagen de Docker
GITLAB_DOCKER="docker.io/gitlab/gitlab-ce"

# * Comando para ejecutar el contenedor
# Primero, exponer la variable GITLAB_HOME
export GITLAB_HOME

# Luego, ejecutar el contenedor
docker run --detach \
--hostname $HOST_NAME \
--publish $IP_HOST:$HTTP_PORT:$HTTP_PORT \
--publish $IP_HOST:$HTTPS_PORT:$HTTPS_PORT \
--publish $IP_HOST:8065:22 \ # Este puerto es especial para pruebas
--name gitlab \
--volume $CONFIG:$HOME/gitlab-test/etc/gitlab \
--volume $LOGS:$HOME/gitlab-test/var/log/gitlab \
--volume $DATA:$HOME/gitlab-test/var/opt/gitlab \
$GITLAB_DOCKER
