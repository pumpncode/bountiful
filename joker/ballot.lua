SMODS.Joker {
    key = 'ballot',
    loc_txt = {
        name = 'Ballot Box',
        text = {
        'Gains {C:chips}+1{} Chip for',
        'every {C:attention}card score{}',
        '{C:inactive}Currently{} {C:chips}+#1#{}',
        '{s:0.6}I played my part!{}'
        }
    },
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    rarity = 1,
    config = {
        extra = {
            chipgain = 0,
            repetitions = 0
        }
    },
    blueprint_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chipgain }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @intersectingplanes', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
    calculate = function(self, card, context)
        local bal = card.ability.extra
        if context.individual and context.cardarea == G.play and not context.blueprint then
            for i=1, #G.play.cards do
                bal.chipgain = bal.chipgain + 1
                bal.repetitions = bal.repetitions + 1
                return {
                    G.play.cards[i]:juice_up(0.5, 0.5),
                    card = card,
                    message = '+1',
                    colour = G.C.CHIPS,
                }
            end
        end
        if context.joker_main and bal.repetitions > 0 then
            return {
                chips = bal.chipgain,
            }
        end
        if context.before or context.after then
            bal.repetitions = 0
        end
    end
}

