How to build : 

1. Build .o file

swiftc -target wasm32-none-wasm -enable-experimental-feature Embedded -wmo -Xcc -fdeclspec -parse-as-library -enable-experimental-feature Extern -Osize ./Sources/NearSDK/NearSDK.swift -c -o build/test-wasm.o


2. Create wasm from .o file

wasm-ld --no-entry ./build/test-wasm.o -o ./build/main.wasm


3. Send it on the chain

near-go deploy -id "neargocli.testnet" -n "testnet"

4.Test it

near-go call   --from neargocli.testnet   --to neargocli.testnet   --function hello   --network testnet
