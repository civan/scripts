set -ex
#!/usr/bin/env/ sh

GROW_PATH="${1: -grow}";
SUBDOMAIN="${2}";

$GROW_PATH stage --subdomain=$SUBDOMAIN;
