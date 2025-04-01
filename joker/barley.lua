SMODS.Joker{
    key = 'barley',
    loc_txt = {
        name = 'Barley Fields',
        text = {
            '{C:money}+$1{} interest cap when',
            'a {C:attention}3{} is scored',
            '{C:inactive}Currently{} {C:attention}+$#1#{} {C:inactive}cap{}',
            '{s:0.6}cash crop for a reason.{}'
        },
    },
    atlas = 'jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.interest }
        }
    end,
    config = { extra = {interest = 0}},
    pos = {x = 9, y = 1},
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 3 then
                local cap = G.GAME.interest_cap
                G.GAME.interest_cap = cap + 5
                card.ability.extra.interest = (G.GAME.interest_cap/5)-5
                return {
                    message = "+!",
                    card = card
                }
            end
        end
        if (context.selling_card or context.remove_playing_cards) and context.card == card and not context.blueprint then
            G.GAME.interest_cap = G.GAME.interest_cap - (card.ability.extra.interest*5)
        end
    end
}
