function getItem()
    local url = "http://localhost:8081/rest/items?type=json"
    local res, code = http.request(url)
    local data = json:decode(res)
    local val = ""
    for k, v in pairs(data.item) do
        val = val .. v.name .." - " .. v.state .."\n"
    end
    return val
end

function run(msg, matches)
    return getItem()
end

return {
    description = "Plugin di prova",
    usage = "!habot [name]",
    patterns = {
        "^!habot (.*)$"
    },
    run = run
}