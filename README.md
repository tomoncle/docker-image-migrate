# docker-image-migrate
To cope with the charges for the Docker Hub organization, this is a migration script that can migrate images within the organization to your individual users.

## Usage

```bash
$ bash docker-image-migrate.sh migrate
username: docker001
password: 
Please enter a username for migration: docker001dev
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded


Current Image：docker001/prometheus
Download remote image: docker001/prometheus:kubernetes start...
kubernetes: Pulling from docker001/prometheus
5040bd298390: Pull complete 
fce5728aad85: Pull complete 
c42794440453: Pull complete 
325995443e2e: Pull complete 
96c08f8447bd: Pull complete 
03399a7522a7: Pull complete 
Digest: sha256:fb27ad7c95bc6f34480059406a34fe67de89d720aaf983837a44ade5421646d4
Status: Downloaded newer image for docker001/prometheus:kubernetes
docker.io/docker001/prometheus:kubernetes
Download remote image: docker001/prometheus:kubernetes success！
Rename image: docker001/prometheus:kubernetes -> docker001dev/prometheus:kubernetes success！
Push remote image: docker001dev/prometheus:kubernetes start...
The push refers to repository [docker.io/docker001dev/prometheus]
e1eb5f4c7e67: Mounted from docker001/prometheus 
9f1fe4f1b2a1: Mounted from docker001/prometheus 
c3a57d6fb6e5: Mounted from docker001/prometheus 
782d5215f910: Mounted from docker001/prometheus 
0eb22bfb707d: Mounted from docker001/prometheus 
a2ae92ffcd29: Mounted from docker001/prometheus 
kubernetes: digest: sha256:fb27ad7c95bc6f34480059406a34fe67de89d720aaf983837a44ade5421646d4 size: 3244
Push remote image: docker001dev/prometheus:kubernetes success！
Untagged: docker001/prometheus:kubernetes
Untagged: docker001/prometheus@sha256:fb27ad7c95bc6f34480059406a34fe67de89d720aaf983837a44ade5421646d4
Untagged: docker001dev/prometheus:kubernetes
Untagged: docker001dev/prometheus@sha256:fb27ad7c95bc6f34480059406a34fe67de89d720aaf983837a44ade5421646d4
Deleted: sha256:70b45d1b39c60d75a4745e59771bde576246871c6dcee396748dfd260aa73fdd
Deleted: sha256:b4ebcac532b1c03acfcb79883713c9ec0e066ea53c2b421a24edb377c66d9a69
Deleted: sha256:94f6984de4f6499462a56a2c7bcd382f6b4006030c817aa75521cc5a3f571d51
Deleted: sha256:b0d6efaec89e2b67d22dde0384f0606a325719960118bd4a037ad4146b52da27
Deleted: sha256:776e361cee01c2e0b8966a0605e6c6c1f2b2abea97c7e7f67a7cd596ed32ebcc
Deleted: sha256:4cbc0ad7007fe8c2dfcf2cdc82fdb04f35070f0e2a04d5fa35093977a3cc1693
Deleted: sha256:a2ae92ffcd29f7ededa0320f4a4fd709a723beae9a4e681696874932db7aee2c
Clean local image cache: docker001/prometheus:kubernetes and docker001dev/prometheus:kubernetes success！
Download remote image: docker001/prometheus:18.1.8 start...
18.1.8: Pulling from docker001/prometheus
5040bd298390: Pull complete 
fce5728aad85: Pull complete 
c42794440453: Pull complete 
0c0da797ba48: Pull complete 
7c9b17433752: Pull complete 
114e02586e63: Pull complete 
e4c663802e9a: Pull complete 
507aecdd770f: Pull complete 
b5b1ced102dd: Pull complete 
e9d4f11ce55c: Pull complete 
c3e761835f34: Pull complete 
8cbfc45c8295: Pull complete 
cb54c5c7df6e: Pull complete 
72079a0b1772: Pull complete 
Digest: sha256:94800844f3c9c06e378ad16eae3279309311158e83011488ea34df44c6923cad
Status: Downloaded newer image for docker001/prometheus:18.1.8
docker.io/docker001/prometheus:18.1.8
Download remote image: docker001/prometheus:18.1.8 success！
Rename image: docker001/prometheus:18.1.8 -> docker001dev/prometheus:18.1.8 success！
Push remote image: docker001dev/prometheus:18.1.8 start...
The push refers to repository [docker.io/docker001dev/prometheus]
22b5fc2caeaf: Mounted from docker001/prometheus 
5f891aa6ad19: Mounted from docker001/prometheus 
0e9dc19dd3da: Mounted from docker001/prometheus 
5a3d140349ae: Mounted from docker001/prometheus 
b66f19824c1f: Mounted from docker001/prometheus 
30565214af3f: Mounted from docker001/prometheus 
c40c73af4376: Layer already exists 
73ad47d4bc12: Layer already exists 
c22c27816361: Layer already exists 
04dba64afa87: Layer already exists 
500ca2ff7d52: Layer already exists 
782d5215f910: Layer already exists 
0eb22bfb707d: Layer already exists 
a2ae92ffcd29: Layer already exists 
18.1.8: digest: sha256:94800844f3c9c06e378ad16eae3279309311158e83011488ea34df44c6923cad size: 3244
Push remote image: docker001dev/prometheus:18.1.8 success！
Untagged: docker001/prometheus:18.1.8
Untagged: docker001/prometheus@sha256:94800844f3c9c06e378ad16eae3279309311158e83011488ea34df44c6923cad
Untagged: docker001dev/prometheus:18.1.8
Untagged: docker001dev/prometheus@sha256:94800844f3c9c06e378ad16eae3279309311158e83011488ea34df44c6923cad
Deleted: sha256:38728e77eadffa50cd11c20e2887605252d32e7bf81a1f957529f7281babded9
Deleted: sha256:332807e3fd7df776a3cba26cc87e044fa04ede3c65bdbf62f32ad96b67a5eb33
Deleted: sha256:dad354c941e1fce68751a5615ff714ef41124336a594637cb7139a38704df1c5
Deleted: sha256:ffc5bea620af69b65caa57215a194957351227a908429af2d934d8152173904e
Deleted: sha256:e1e4bfe0fee78daac439771f6fc645e73d53cbf2185898748cd0041282b79944
Deleted: sha256:9f3d8aadad6b100e8599ae5ec61df9e61dd4b6810d8a059933e1b9eeffc05748
Deleted: sha256:4aab26ed9c8e270ca74a30872ee7db629bb43fda20405454c3f643edb8f3e9b6
Deleted: sha256:18adc09b527ccf35ad48b1205b77ee00153ec67f3bc76e84f784a7aed61d98af
Deleted: sha256:bfd0e7a05a17ae4cd80ff83a902a0822231df75cfaefedf6cd81c7071a1a00fe
Deleted: sha256:c6875c9b42a8b79355c0e24f8934028b0a6790e2f468a97db981ccff37bbb120
Deleted: sha256:62fa60602099dcce9f40e8973251fdaf664ae107e4d5df395f34fc3d98dc3dd8
Deleted: sha256:b0d6efaec89e2b67d22dde0384f0606a325719960118bd4a037ad4146b52da27
Deleted: sha256:776e361cee01c2e0b8966a0605e6c6c1f2b2abea97c7e7f67a7cd596ed32ebcc
Deleted: sha256:4cbc0ad7007fe8c2dfcf2cdc82fdb04f35070f0e2a04d5fa35093977a3cc1693
Deleted: sha256:a2ae92ffcd29f7ededa0320f4a4fd709a723beae9a4e681696874932db7aee2c
Clean local image cache: docker001/prometheus:18.1.8 and docker001dev/prometheus:18.1.8 success！


Current Image：docker001/ubuntu
Download remote image: docker001/ubuntu:bionic start...
```
