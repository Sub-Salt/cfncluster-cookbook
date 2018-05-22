#!/bin/bash -x

set -euo pipefail

cookbook_name="cfncluster-cookbook-1.4.1"
tarball_name="${cookbook_name}.tgz"
deploy_dir="./${cookbook_name}/"

mkdir -p "${deploy_dir}"
git archive HEAD | tar -x -C "${deploy_dir}"

cd "${deploy_dir}"

rm -rf .gitattributes
rm -rf .github
rm -rf .gitignore
rm -rf .kitchen.cloud.yml
rm -rf .kitchen.yml
rm -rf Berksfile.lock
rm -rf CODE_OF_CONDUCT.md
rm -rf CONTRIBUTING.md
rm -rf build_ami.sh
rm -rf build_env_setup.sh
rm -rf packer_alinux.json
rm -rf packer_centos6.json
rm -rf packer_centos7.json
rm -rf packer_ubuntu1404.json
rm -rf packer_ubuntu1604.json
rm -rf packer_update_centos_base.json
rm -rf packer_variables.json
rm -rf cookbook_archive.sh
rm -rf spec
rm -rf test

cd ..
tar czf "${tarball_name}" "${cookbook_name}/"
rm -rf "${cookbook_name}/"
