# Documentación General

Este documento contiene la documentación general para la instalación e integración de un servicio
de control de versiones (CVS) para el proyecto MiLAB. El CVS a ser empleado es [GitLab](https://about.gitlab.com/).

Este documento se divide en las siguientes secciones:

- Justificación
- Instalación
- Configuración
  - SSO y SAML
  - Restricciones de uso.
  - Uso de _GitLab Pages._

# Justifiación

WIP

# Instalación

La instalación se lleva a cabo siguiendo las instrucciones detalladas de la [documentación oficial](https://about.gitlab.com/install/#debian).
En particular, se instaló en un sistema que cuenta con el sistema operativo GNU/Linux Debian 10, por lo que estás
instrucciones de instalación se llevaron a cabo específicamente para este sistema.

**NOTA:** Para todas las operaciones de instalación y configuración se requieren de _permisos de administrador._

## Dependencias

Primero se deben instalar las dependencias necesarias.

```shell
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
```

## Paquete de GitLab a instalación al sistema

El paquete específico de GNU/Linux Debian esta localizado en un repositorio especial, el cual
se instala utilizando el siguiente comando

```shell
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
```

Este comando agregará el repositorio especial de GitLab al sistema operativo. Una vez hecho esto, ahora
se procede a instalar GitLab directamente a la máquina.

### Requisitos

Para poder instalar GitLab directamente se requiere de un URL válido, con un DNS configurado previamente.
El que se propone de ejemplo es `https://gitlab.example.com`.
Algo importante a notar es que si se especifica el protocolo `https://`, GitLab automáticamente solicitará
certificados de encriptación usando [Let's Encrypt](https://letsencrypt.org/).

### Instalación mediante administrador de paquetes

Una vez que se han cumplido con los requisitos, la instalación procede con el siguiente comando

```shell
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee
```

donde se debe modifiar la variable `EXTERNAL_URL` por la correcta, siguiendo los requisitos de arriba.
Esto se debe a que con el comando de anterior de `curl` se instaló el repositorio donde existe ahora
el paquete `gitlab-ee`. Es por eso que se puede instalar directamente con el administrador de paquetes
de Debian, `apt-get`.

Esta instalación tardará aproximadamente entre 20 a 30 minutos según la conexión a internet.
Una vez terminada, el sistema está instalado y configurado por default.

## Primera visita y ajuste de contraseña

Cuando se visita por primera vez el sistema, después de ser instalado, aparecerá una página donde se solicita
que se especifique una contraseña para configurar **la cuenta de administrador** del sistema de GitLab.

Una vez que se proporciona una contraseña para el usuario `root`, se redirige a la página de ingreso.
