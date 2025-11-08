return function(WindUI, Window, autofish)
    local MainTab = Window:Tab({ Title = "Main", Icon = "fish" })

    MainTab:Toggle({
        Title = "Auto Fish",
        Callback = function(state)
            if state then
                autofish.start()
            else
                autofish.stop()
            end
        end
    })

    MainTab:Slider({
        Title = "Delay Fishing",
        Step = 0.1,
        Value = { Min = 0, Max = 3, Default = 1 },
        Callback = function(v)
            autofish.normaldelay = v
        end
    })
end
