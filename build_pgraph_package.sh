#!/bin/bash
reset

pushd .

# Remove Old versions
rm pgraph_0.8.tar.gz
R CMD REMOVE --library=../install pgraph

# build new version
R CMD build --no-build-vignettes --no-manual pgraph

# install in our directory
R CMD INSTALL --library=../install pgraph_0.8.tar.gz

popd
