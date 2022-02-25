function ip2dec(ip)
    local i, dec = 3, 0;
    for d in string.gmatch(ip, "%d+") do
        dec = dec + 2 ^ (8 * i) * d;
        i = i - 1
    end ;
    return dec
end

function dec2ip(decip)
    local divisor, quotient, ip;
    for i = 3, 0, -1 do
        divisor = 2 ^ (i * 8);
        quotient, decip = math.floor(decip / divisor), math.fmod(decip, divisor);
        if nil == ip then
            ip = quotient
        else
            ip = ip .. "." .. quotient
        end
    end
    return ip
end


print(ip2dec("192.168.1.1"))