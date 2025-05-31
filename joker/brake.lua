SMODS.Joker{
    key = 'brake',
    loc_txt = {
        name = 'Brake Pedal',
        text = {
            'Destroys the {C:attention}{}first played{}',
            'card and gains its {C:chips}Chips{}',
            '{C:inactive}Currently{} {C:chips}+#1#{}',
            '{s:0.6}screeeeeeechhhh. crash.wav{}'
        },
    },
    atlas = 'jokers',
    rarity = 3,
    cost = 9, 
    blueprint_compat = true,
    perishable_compat = false,
    config = { extra = { chips = 0 }},
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @avocadoexists', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
    pos = {x = 7, y = 1},
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.full_hand[1].b_brake = true
            card.ability.extra.chips = card.ability.extra.chips + context.other_card.base.nominal + context.other_card.ability.bonus + context.other_card.ability.perma_bonus
            return {
                message = '+'..(context.other_card.base.nominal + context.other_card.ability.bonus + context.other_card.ability.perma_bonus),
                card = card
            }
        end
        if context.destroying_card and context.destroying_card.b_brake == true then
            return {
                remove = true,
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end
}
