SMODS.Joker{
    key = 'brokerdealer',
    loc_txt = {
        name = 'Broker Dealer',
        text = {
            'Discarding a {C:attention}Gold{}',
            'card gives {C:money}$3{}',
            '{s:0.6}the deal of all time.{}'
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 0 }},
    pos = {x = 2, y = 0},
	calculate = function(self, card, context)
        if context.discard then
            if SMODS.has_enhancement(context.other_card, "m_gold") then
                card.ability.extra.dollars = 0
                card.ability.extra.dollars = card.ability.extra.dollars + 3
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}