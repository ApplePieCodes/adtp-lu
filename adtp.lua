local json = require("dkjson")

local adtp = {}

adtp.RequestBuilder = {}

adtp.Version = {
    Adtp2 = 0
}

adtp.Method = {
    Check = 0,
    Read = 1,
    Create = 2,
    Update = 3,
    Append = 4,
    Destroy = 5,
    Auth = 6
}

adtp.Status = {
    SwitchProtocols = 0,
    Ok = 1,
    Pending = 2,
    Redirect = 3,
    Denied = 4,
    BadRequest = 5,
    Unauthorized = 6,
    NotFound = 7,
    TooManyRequests = 8,
    InternalError = 9,
}

function adtp.RequestBuilder.new()
    local self = setmetatable({}, { __index = adtp.RequestBuilder })
    self.version = adtp.Version.Adtp2
    self.method = adtp.Method.Check
    self.headers = {}
    self.uri = ""
    self.content = ""
    return self    
end

function adtp.RequestBuilder:set_version(version)
    self.version = version
    return self
end

function adtp.RequestBuilder:set_method(method)
    self.method = method
    return self
end

function adtp.RequestBuilder:add_header(key, value)
    self.headers[key] = value
    return self
end

function adtp.RequestBuilder:set_uri(uri)
    self.uri = uri
    return self
end

function adtp.RequestBuilder:set_content(content)
    self.content = content
    return self
end

local function get_version_string(version)
    if version == adtp.Version.Adtp2 then
        return "ADTP/2.0"
    end
end

local function get_method_string(method)
    if method == adtp.Method.Check then
        return "check"
    elseif method == adtp.Method.Read then
        return "read"
    elseif method == adtp.Method.Create then
        return "create"
    elseif method == adtp.Method.Update then
        return "update"
    elseif method == adtp.Method.Append then
        return "append"
    elseif method == adtp.Method.Destroy then
        return "destroy"
    elseif method == adtp.Method.Auth then
        return "auth"
    end
end

function adtp.RequestBuilder:build()
    return json.encode({
        version = get_version_string(self.version),
        method = get_method_string(self.method),
        headers = self.headers,
        uri = self.uri,
        content = self.content
    })
end

adtp.ResponseBuilder = {}

function adtp.ResponseBuilder.new()
    local self = setmetatable({}, { __index = adtp.ResponseBuilder })
    self.version = adtp.Version.Adtp2
    self.status = adtp.Status.Ok
    self.headers = {}
    self.content = ""
    return self    
end

function adtp.ResponseBuilder:set_version(version)
    self.version = version
    return self
end

function adtp.ResponseBuilder:set_status(status)
    self.status = status
    return self
end

function adtp.ResponseBuilder:add_header(key, value)
    self.headers[key] = value
    return self
end

function adtp.ResponseBuilder:set_content(content)
    self.content = content
    return self
end

local function get_status_string(status)
    if status == adtp.Status.SwitchProtocols then
        return "switch-protocols"
    elseif status == adtp.Status.Ok then
        return "ok"
    elseif status == adtp.Status.Pending then
        return "pending"
    elseif status == adtp.Status.Redirect then
        return "redirect"
    elseif status == adtp.Status.Denied then
        return "denied"
    elseif status == adtp.Status.BadRequest then
        return "bad-request"
    elseif status == adtp.Status.Unauthorized then
        return "unauthorized"
    elseif status == adtp.Status.NotFound then
        return "not-found"
    elseif status == adtp.Status.TooManyRequests then
        return "too-many-requests"
    elseif status == adtp.Status.InternalError then
        return "internal-error"
    end
end

function adtp.ResponseBuilder:build()
    return json.encode({
        version = get_version_string(self.version),
        status = get_status_string(self.status),
        headers = self.headers,
        content = self.content
    })
end

return adtp