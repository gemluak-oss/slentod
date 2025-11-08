return function(WindUI)
    WindUI:AddTheme({
        Name = "ijo",
        Accent = Color3.fromHex("#00FFAB"),
        Dialog = Color3.fromHex("#142013"),
        Outline = Color3.fromHex("#4C956C"),
        Text = Color3.fromHex("#E8F5E9"),
        Placeholder = Color3.fromHex("#9FC59F"),
        Background = WindUI:Gradient({
            ["0"] = { Color = Color3.fromHex("#0B1C0B"), Transparency = 0 },
            ["100"] = { Color = Color3.fromHex("#020E02"), Transparency = 0 },
        }, { Rotation = 90 }),
        Button = Color3.fromHex("#06923E"),
        Icon = Color3.fromHex("#06923E")
    })
    WindUI:SetTheme("ijo")
end
