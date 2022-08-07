if not shared.SignalStorage then
    shared.SignalStorage = {}
end

local SignalStorage = shared.SignalStorage
local SignalCleanup = {}; SignalCleanup.__index = SignalCleanup

function SignalCleanup.RegisterSignalGroup(Name)
    if SignalStorage[Name] then
        for Index, Value in pairs(SignalStorage[Name]) do
            Value:Disconnect();
        end
    end
    
    SignalStorage[Name] = {}
    
    
    return setmetatable({
        Storage = SignalStorage[Name];
    }, SignalCleanup);
end


function SignalCleanup:AddSignal(Connection)
    table.insert(self.Storage, Connection)
    
    local Created = #self.Storage
    
    return {
        Destroy = function()
            table.remove(self.Storage, Created);
        end -- No need for metatable for single method
    }
end

return SignalCleanup
