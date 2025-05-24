package = "adtp"
version = "1.0-1"
source = {
    url = "git://github.com/ApplePieCodes/adtp-lu",
    tag = "v1.0"
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