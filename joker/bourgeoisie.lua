SMODS.Joker{
    key = 'bourgeoisie',
    loc_txt = {
        name = 'Bourgeoisie',
        text = {
            '{C:green}#1# in X{} chance to',
            'earn {C:money}$X{} where {C:attention}X{} is',
            'the rank of each',
            '{C:attention}scored 7, 8, 9, or 10{}',
            '{s:0.6}we support numbered card synergies.{}',
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 0 }},
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1)}}
    end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local rank = context.other_card:get_id()
            local lodds = G.GAME.probabilities.normal
            if rank >= 7 and rank <= 10 and pseudorandom('b') < (lodds / rank ) then
                card.ability.extra.dollars = 0
                card.ability.extra.dollars = card.ability.extra.dollars + rank
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}