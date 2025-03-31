SMODS.Joker{
    key = 'basicity',
    loc_txt = {
        name = 'Basicity',
        text = {
            '{C:blue}Common{} Jokers give',
            '{C:chips}+14{} Chips and {C:mult}+3{} Mult',
            '{s:0.6}7 in 15 people are basic{}',
            '{s:0.6}according to litmus tests.{}'
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 0, chips = 0 }},
    pos = {x = 9, y = 0},
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.mult = 0
            card.ability.extra.chips = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.rarity == 1 then
                    card.ability.extra.mult = card.ability.extra.mult + 3
                    card.ability.extra.chips = card.ability.extra.chips + 14
                end
            end
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}