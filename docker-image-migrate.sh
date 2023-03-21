#! /bin/bash
# 
# Copyright tomoncle.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

function waitasecond(){
    sleep 1
}

function info(){
    echo -e "\033[6;34m$1\033[0m"
}

function trace(){
    echo -e "\033[6;33m$1\033[0m"
}

function error(){
    echo -e "\033[6;31m$1\033[0m"
}

function shine(){
    echo -e "\033[5;32m$1\033[0m"
}

function get(){
    echo $(curl -s $1 | jq '.results[].name' | awk '{gsub("\"", "");print}')
}

function init(){
    read -p "username: " username
    read -p "password: " -s -r password
    echo
    token=$(curl -s -X POST -H "Content-Type:application/json" -d '{"username":"'$username'","password":"'$password'"}' 'https://hub.docker.com/v2/users/login' | jq -r .token)
    if [[ $token = "null" ]] ; then
          error "Incorrect authentication credentials"
          exit
    fi
    docker login -u $username --password $password > /dev/null 2>&1   
}

function listImages(){
    echo $(get "https://hub.docker.com/v2/repositories/$username/?page_size=10000&page=1") 
}

function listTags(){
    echo $(get "https://hub.docker.com/v2/repositories/$username/$1/tags/?page_size=10000&registry")
}

function delTag() {
    url="https://hub.docker.com/v2/repositories/$username/$1/tags/$2/"
    code=$(curl -i -s -X DELETE -H "Authorization:Bearer $token" $url | head -n 1 | awk '{print $2}')
    if [[ $code -ne 204 ]] ; then
          echo 1
    else 
          echo 0
    fi
}

# renew push image
# args1: image
# args2: tag
function rePushImage(){
    image=$username/$1
    tag=$2
    waitasecond
    trace "Download remote image: $image:$tag start..."
    docker pull $image:$tag
    if [[ $? -ne 0 ]]; then
          error "Download remote image: $image:$tag fail！"
          exit
    fi
    info "Download remote image: $image:$tag success！"
    waitasecond
    trace "Delete remote image: $image:$tag start..."
    code=$(delTag $1 $2)
    if [[ $code -ne 0 ]] ; then
          docker rmi $image:$tag > /dev/null 2>&1
          error "Delete remote image: $image:$tag fail！statusCode: $code"
          exit
    fi
    info "Delete remote image: $image:$tag success！"
    waitasecond        
    trace "Push remote image: $image:$tag start..."
    docker push $image:$tag
    if [[ $? -eq 0 ]]; then
          info "Push remote image: $image:$tag success！"
          docker rmi $image:$tag
          info "Clean local image cache: $image:$tag success！"
    else
          error "Push remote image: $image:$tag fail！"
          exit
    fi
}

# migrate image
# args1: image
# args2: tag
# args3: target
function migrateImage(){
    image=$username/$1
    tag=$2
    target=$3/$1
    waitasecond

    trace "Download remote image: $image:$tag start..."
    docker pull $image:$tag
    if [[ $? -ne 0 ]]; then
          error "Download remote image: $image:$tag fail！"
          exit
    fi
    info "Download remote image: $image:$tag success！"
    waitasecond
    docker tag $image:$tag $target:$tag
    info "Rename image: $image:$tag -> $target:$tag success！"
    trace "Push remote image: $target:$tag start..."
    docker push $target:$tag
    if [[ $? -eq 0 ]]; then
          info "Push remote image: $target:$tag success！"
          docker rmi $image:$tag $target:$tag
          info "Clean local image cache: $image:$tag and $target:$tag success！"
    else
          error "Push remote image: $target:$tag fail！"
          exit
    fi
}

function repush(){
    IMGS=$(listImages)
    for img in ${IMGS[*]} 
    do
          tags=$(listTags $img)
          echo -e "\n"
          shine "Current Image：$username/$img"
          waitasecond
          for tag in ${tags[*]}
          do
                rePushImage $img $tag
          done    
          sleep 2
    done
}

function migrate(){
    read -p "Please enter a username for migration: " migrateUser
    docker login -u $migrateUser
    if [[ $? -ne 0 ]]; then
          error "login fail！"
          exit
    fi
    IMGS=$(listImages)
    for img in ${IMGS[*]} 
    do
          tags=$(listTags $img)
          echo -e "\n"
          shine "Current Image：$username/$img"
          waitasecond
          for tag in ${tags[*]}
          do
                migrateImage $img $tag $migrateUser
          done    
          sleep 2
    done
}

# main
case $1 in
    repush )
            init
            repush
    ;;
    migrate ) 
            init
            migrate
    ;;
    *)
            error "USEAGE: args [repush|migrate]
      
    repush     : anew push image to docker hub.
    migrate    : migrate image to annother user.
        "
    ;;
esac
