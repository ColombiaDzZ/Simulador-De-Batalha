
-- Dependencia
local utils = require("utils")
local player = require("player.player")
local playerActions = require("player.actions")
local colosus = require("colosus.colosus")
local colosusActions = require("colosus.actions")

-- Habilitar UTF8 no Terminal
utils.enableUtf8()
os.execute("chcp 65001")

-- Header
print("")
print("         ")
print("")
print([[
==========================================================================================

    ,_._._._._._._._._|__________________________________________________________,
    |_|_|_|_|_|_|_|_|_|_________________________________________________________/
                      |

           -------------------------------------------------
                  ⚔       SIMULADOR DE BATALHA    ⚔       
==========================================================================================

                Você empunha sua espada e se prepara para lutar.
                              È hora da batalha! ⚔
]])

-- Obter definição do jogador

-- Apresentar o montro
local boss = colosus
local bossActions = colosusActions
utils.printCreature(boss)

playerActions.build()
bossActions.build()

-- Começar loop de batalha
while true do

    -- Mostrar ações para o player
    print()
    print(string.format("Qual será a próxima ação de %s", player.name))
    local validPlayerActions = playerActions.getValidActions(player, boss)
    for i, action in pairs(validPlayerActions) do
        print(string.format("%d. %s", i, action.description))
    end
    local chosenIndex = utils.ask()
    local chosenAction = validPlayerActions[chosenIndex]
    local isActionsIsValid = chosenAction ~= nil
    -- TODO
    if isActionsIsValid then
        chosenAction.execute(player, boss)
    else
        print("Sua escolha é invalida, %s perdeu a vez", player.name)
    end

    -- Ponto de saida, mosntro ficou sem vida
    if boss.health <= 0 then
        break
    end

    -- Simular turno da criatura
    print()
    local validBossActions = bossActions.getValidActions(player, boss)
    local bossActions = validBossActions[math.random(#validBossActions)]
    bossActions.execute(player, boss)
    -- TODO

    -- Ponto de saida, jogador ficou sem vida

    if player.health <= 0 then
        break
    end
end

-- Fim

if player.health <= 0 then
    print()
    print("---------------------------------------------------------")
    print()
    print("😪")
    print(string.format("%s não foi capaz de vencer %s", player.name, boss.name))
    print("Quem sabe na próxima vez...")
    print()
    elseif boss.health <= 0 then
    print()
    print("---------------------------------------------------------")
    print()
    print("🥳")
    print(string.format("%s prevaleceu e vendeu %s", player.name, boss.name))
    print("Parabéns!!!")
    print()
end