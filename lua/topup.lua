local function topup(env)
    if not env.engine.context:get_selected_candidate() then
        env.engine.context:clear()
    else
        env.engine.context:commit()
    end
end

local function init(env)
end

local function ftopup(key_event, env)
-- 处理，获取对象
    local engine = env.engine
    local context = engine.context
-- 获取已输入编码和长度
    local input = context.input
    local input_len = string.len(input)
    local code2 = string.sub(input, 2, 2)
    local code5 = string.sub(input, 5, 5)
    local code10 = string.sub(input, 10, 10)
    local ch = key_event.keycode

    if ch < 0x61 or ch > 0x7a then
        return 2
    end

    if input_len == 5 and (code5 == 'x' or code2 == 'd' or code2 == 'f') then
        topup(env)
    elseif input_len == 10 and code10 == 'o' then
        topup(env)
    elseif input_len == 15 then
        topup(env)
    end
    return 2
end

return { init = init, func = ftopup }
