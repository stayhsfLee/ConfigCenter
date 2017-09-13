#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#git pull

rm -rf target
rm -rf release
mkdir release

if [ -z "$JAVA_HOME" ]; then
  echo "Please set the env of JAVA_HOME"
else
    mvn -Dmaven.test.skip=true clean package install assembly:assembly -U

#   setup the cc-server moudle
    cd release
    ln -s ../target/cc-server/cc-server   cc-server
    ln -s ../target/cc-client/cc-client   cc-client
fi
