#!/bin/bash

## For 10.3.30.165
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_2bede54ab14e4d42a6db348c02bd3dd2 -i
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_822f9e53e2be4e32b576941dac49566d -i

## For 10.3.30.189
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_018dcd2252bd490d8b3d03143e1b2018 -i
curl 10.3.30.230:8080/clusters/cltest/tenants -X POST -d tenantName=AUTH_287e400117b84e0fac1fbea4ea97c15b -i

./.functests test_account.py
./.functests test_container.py
./.functests test_object.py
# ./.functests tests.py

## Or all of them:
# ./.functests
