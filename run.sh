# La variable de entorno para GitLab,
# será para montar al contenedor, pero hay que modificarla de acuerdo
# a los permisos en el servidor
GITLAB_HOME=$HOME/gitlab-test/srv/gitlab

mkdir -p ${GITLAB_HOME}

# * IP y hostname
HOST_NAME="milabproy.redclara.net"
IP_HOST=190.15.141.11

# * Puertos
HTTP_PORT=80
HTTPS_PORT=443

# * Volumenes
HOST_CONFIG=$HOME/gitlab-test/etc/gitlab
CONFIG=$GITLAB_HOME/config
HOST_LOGS=$HOME/gitlab-test/var/log/gitlab
LOGS=$GITLAB_HOME/logs
HOST_DATA=$HOME/gitlab-test/var/opt/gitlab
DATA=$GITLAB_HOME/data

# * Crear los directorios no existentes
mkdir -p ${CONFIG}
mkdir -p ${HOST_CONFIG}
mkdir -p ${HOST_LOGS}
mkdir -p ${LOGS}
mkdir -p ${HOST_DATA}
mkdir -p ${DATA}

# * Imagen de Docker
GITLAB_DOCKER="docker.io/gitlab/gitlab-ce"
# GITLAB_DOCKER="gitlab:v1.2"

# * Comando para ejecutar el contenedor
# Primero, exponer la variable GITLAB_HOME
export GITLAB_HOME

# Luego, ejecutar el contenedor
sudo docker run --detach \
--env GITLAB_OMNIBUS_CONFIG="external_url 'https://milabproy.redclara.net/'; letsencrypt['enable'] = true" \
--hostname $HOST_NAME \
--publish $IP_HOST:$HTTP_PORT:$HTTP_PORT \
--publish $IP_HOST:$HTTPS_PORT:$HTTPS_PORT \
--publish $IP_HOST:8065:22 \
--name gitlab \
--volume $CONFIG:$HOST_CONFIG \
--volume $LOGS:$HOST_LOGS \
--volume $DATA:$HOST_DATA \
$GITLAB_DOCKER
