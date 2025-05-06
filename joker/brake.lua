SMODS.Joker{
    key = 'brake',
    loc_txt = {
        name = 'Brake Pedal',
        text = {
            'Destroys the {C:attention}{}first card{}',
            'in the winning hand and',
            'gains its {C:chips}chips{}',
            '{C:inactive}Currently{} {C:chips}+#1#{}',
            '{s:0.6}screeeeeeechhhh. crash.wav{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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
            if context.other_card == context.scoring_hand[1] and not context.blueprint then
                context.other_card.b_brake = true
                local hold = card.ability.extra.chips + (context.other_card.base.nominal + context.other_card.ability.bonus + context.other_card.ability.perma_bonus)
                card.ability.extra.chips = hold
            end
            if context.other_card == context.scoring_hand[1] then
            return {
                message = '+'..(context.other_card.base.nominal + context.other_card.ability.bonus + context.other_card.ability.perma_bonus),
                card = card
            }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
        if context.destroying_card and context.destroying_card.b_brake == true then
            return {
                remove = true,
            }
        end
    end
}