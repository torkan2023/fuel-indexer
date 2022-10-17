#!/bin/bash
#
# Usage: bash scripts/startt_test_components.bash
#
# Expects binaries for test components to have already been built via:
#   cargo build -p fuel-indexer-test-web --release

bash ./scripts/kill_test_components.bash

./target/release/fuel-node \
    --wallet-path ./fuel-indexer-tests/components/web/wallet.json \
    --bin-path ./fuel-indexer-tests/contracts/fuel-indexer-test/out/debug/fuel-indexer-test.bin &

sleep 2

./target/release/web-api \
    --wallet-path ./fuel-indexer-tests/components/web/wallet.json \
    --bin-path ./fuel-indexer-tests/contracts/fuel-indexer-test/out/debug/fuel-indexer-test.bin &

if [[ ! -z $CI ]] ; then
    sleep 2

    ./target/release/fuel-indexer \
        --manifest fuel-indexer-tests/assets/fuel_indexer_test.yaml \
        --postgres-password my-secret &
fi
