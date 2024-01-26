local utils = {}

function utils.enableUtf8()
    os.execute("chcp 65001")
end

function utils.printHeader()
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
end

-- Função que recebe um atributo e nos retorna uma barra
function utils.getProgressBar(attribute)
    local fullChar = "▰"
    local emptyChar = "▱"

    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

function utils.printCreature(creature)
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

-- Cartão
    print("| Nome: " .. creature.name)
    print("| ")
    print("| Descrição: " .. creature.description)
    print("| ")
    print("| Atributos Colosus: ")
    print("| ")
    print("|    Vida:         " .. utils.getProgressBar(healthRate))
    print("|    Ataque:       " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:       " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:   " .. utils.getProgressBar(creature.speed))
end



function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

return utils