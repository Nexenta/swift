#!/bin/bash

#
# Author:    Victor Piousbox
# Copyright: Nexenta Systems
# Date:      20141025
#
# This file is the endpoint for swift python tests, as run from Jenkins.
#

## For 10.3.30.165
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_2bede54ab14e4d42a6db348c02bd3dd2 -i
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_822f9e53e2be4e32b576941dac49566d -i

## For 10.3.30.189
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_018dcd2252bd490d8b3d03143e1b2018 -i
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_287e400117b84e0fac1fbea4ea97c15b -i

## For 10.3.30.165/164
curl 10.3.30.164:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_2bede54ab14e4d42a6db348c02bd3dd2 -i
curl 10.3.30.164:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_822f9e53e2be4e32b576941dac49566d -i
curl 10.3.30.164:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_018dcd2252bd490d8b3d03143e1b2018 -i
curl 10.3.30.164:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_287e400117b84e0fac1fbea4ea97c15b -i

## For cyberduck
curl 10.3.30.230:9981/v1/test/10.3.30.230 -X PUT -i
curl 10.3.30.230:9981/v1/test/10.3.30.230/ddd -X PUT -i
curl 10.3.30.230:9981/v1/test/10.3.30.230/ddd/a -X PUT -i
curl 10.3.30.230:9981/v1/test/10.3.30.230/ddd/aa -X PUT -i
curl 10.3.30.230:9981/v1/test/10.3.30.230/ddd/b -X PUT -i
curl 10.3.30.230:9981/v1/test/10.3.30.230/ddd/c -X PUT -i

# actual jenkins regression
curl 10.3.30.164:9981/v1/test/10.3.30.230 -X PUT -i
curl 10.3.30.164:9981/v1/test/10.3.30.230/ddd -X PUT -i
curl 10.3.30.164:9981/v1/test/10.3.30.230/ddd/a -X PUT -i
curl 10.3.30.164:9981/v1/test/10.3.30.230/ddd/aa -X PUT -i
curl 10.3.30.164:9981/v1/test/10.3.30.230/ddd/b -X PUT -i
curl 10.3.30.164:9981/v1/test/10.3.30.230/ddd/c -X PUT -i


##
## Execution
##
function test {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
    fi
    return $status
}

test ./.functests test_account.py
test ./.functests test_container.py
test ./.functests test_object.py
# test ./.functests tests.py

## Or all of them:
# test ./.functests
