-- Eclipse X Hub v1
-- Script desenvolvido pela equipe Eclipse

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
workspace.FallenPartsDestroyHeight = -math.huge

local Window = Library:MakeWindow({
    Title = "🌑 Eclipse X Hub v1 🌑",
    SubTitle = "by: Eclipse Team",
    LoadText = "Carregando Eclipse X Hub...",
    Flags = "eclipseXHub_v1"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://1120738435", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- Aba de Informações
local InfoTab = Window:MakeTab({ Title = "Informações", Icon = "rbxassetid://10723415903" })

InfoTab:AddSection({ "Sobre o Script" })
InfoTab:AddParagraph({ "Desenvolvedores:", "Eclipse Team" })
InfoTab:AddParagraph({ "Versão:", "1.0" })
InfoTab:AddParagraph({ "Status:", "Ativo" })
InfoTab:AddParagraph({ "Descrição:", "O Eclipse X Hub oferece diversas ferramentas para melhorar sua experiência no jogo." })

InfoTab:AddSection({ "Utilidades" })
InfoTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

-- Aba de Player
local PlayerTab = Window:MakeTab({ Title = "Player", Icon = "rbxassetid://10734952036" })

PlayerTab:AddSection({ "Movimento" })
PlayerTab:AddSlider({
    Name = "Velocidade",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

PlayerTab:AddSlider({
    Name = "Força de Pulo",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

PlayerTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(state)
        getgenv().noclip = state
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not state
                end
            end
        end
    end
})

-- Aba de Troll
local TrollTab = Window:MakeTab({ Title = "Troll", Icon = "rbxassetid://13364900349" })

TrollTab:AddSection({ "Ferramentas de Troll" })
TrollTab:AddButton({
    Name = "Black Hole",
    Description = "Cria um buraco negro que puxa objetos próximos",
    Callback = function()
        -- Código do black hole aqui
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EclipseScripts/EclipseXHub/main/BlackHole.lua"))()
    end
})

TrollTab:AddToggle({
    Name = "RGB Character",
    Description = "Seu personagem muda de cor continuamente",
    Default = false,
    Callback = function(state)
        if state then
            while getgenv().rgbEnabled do
                for _, color in ipairs({"Bright red", "Lime green", "Bright blue", "Bright yellow"}) do
                    if not getgenv().rgbEnabled then break end
                    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer(color)
                    wait(0.5)
                end
            end
        else
            getgenv().rgbEnabled = false
        end
    end
})

-- Aba de Scripts
local ScriptsTab = Window:MakeTab({ Title = "Scripts", Icon = "rbxassetid://131153193945220" })

ScriptsTab:AddSection({ "Scripts Populares" })
ScriptsTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

ScriptsTab:AddButton({
    Name = "Dark Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
    end
})

-- Função para manter o script atualizado
local function checkUpdates()
    local latestVersion = game:HttpGet("https://raw.githubusercontent.com/EclipseScripts/EclipseXHub/main/version.txt")
    if latestVersion ~= "1.0" then
        Window:MakeNotification({
            Title = "Atualização Disponível",
            Content = "Uma nova versão do Eclipse X Hub está disponível!",
            Time = 10
        })
    end
end

-- Verificar atualizações ao iniciar
spawn(checkUpdates)

print("Eclipse X Hub v1 carregado com sucesso!")
