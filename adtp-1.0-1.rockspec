package = "adtp"
version = "1.0-1"
source = {
    url = "https://github.com/ApplePieCodes/adtp-lu/archive/refs/tags/v1.0.tar.gz",
}
description = {
    summary = "The ADTP Protocol",
    detailed = "ADTP: Alula's Data Transfer Protocol",
    license = "MIT",
    homepage = "https://applepiecodes.github.io/adtp"
}
dependencies = {}
build = {
    type = "builtin",
    modules = {
        adtp = "adtp.lua",
        dkjson = "dkjson.lua"
    }
}