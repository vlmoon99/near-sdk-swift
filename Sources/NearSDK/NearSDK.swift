@_extern(wasm, module: "env", name: "input")
@_extern(c)
func input(_ registerId: UInt64)

@_extern(wasm, module: "env", name: "log_utf8")
@_extern(c)
func log_utf8(_ len: UInt64, _ ptr: UInt64)

let atomicOpRegister: UInt64 = UInt64.max - 2

@_expose(wasm, "hello")
@_cdecl("hello")
func hello() {
    input(atomicOpRegister)
    let utf8Bytes: [UInt8] = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
    
    utf8Bytes.withUnsafeBytes { rawBuffer in
        let pointer = rawBuffer.baseAddress!
        let length = utf8Bytes.count
        log_utf8(UInt64(length), UInt64(UInt(bitPattern: pointer)))
    }
}