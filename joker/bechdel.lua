SMODS.Joker{
    key = 'bechdel',
    loc_txt = {
        name = 'Bechdel Test',
        text = {
            '{C:mult}+19{} Mult and {C:chips}+86{} Chips if',
            'played hand contains two {C:attention}Queens{}',
            '{s:0.6}that presumedly aren\'t talking about a King.{}'
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { extra = { chips = 86, mult = 19 }},
    pos = {x = 4, y = 0},
	calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 12 then
                    count = count + 1
                end
            end
            if count >= 2 then
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
