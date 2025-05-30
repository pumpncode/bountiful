SMODS.Joker{
    key = 'banderole',
    loc_txt = {
        name = 'Banderole',
        text = {
            'Gains {C:chips}+#1#{} Chips per',
            'remaining {C:red}discard{}',
            'at the end of round',
            '{C:inactive}Currently +#2#{}',
            '{s:0.6}fly everywhere{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    demicoloncompat = true,
    perishable_compat = false,
    config = { extra = { chips = 0, chip_mod = 5 }},
    pos = {x = 3, y = 3},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extrachip_mod, card.ability.extra.chips}}
    end,
	calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + (G.GAME.current_round.discards_left * 5)
            return {
                message = '+'..(G.GAME.current_round.discards_left * 5)..' Chips',
                colour = G.C.CHIPS
            }
        end
    end
}
