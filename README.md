# SignalCleanup
simple cleanup


```lua
local SignalCleanup  = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/SignalCleanup/main/main.lua'))()

local Signals = SignalCleanup.RegisterSignalGroup("Current")

local Signal = Signals:AddSignal(game.Players.LocalPlayer.CharacterAdded:Connect(function(Message)
    print(Message)
end));

```
