SMODS.Joker{
    key = 'beneficiary',
    loc_txt = {
        name = 'Beneficiary',
        text = {
            'Sell this card for',
            '{C:attention}+#1#{} Bonus Cards',
            '{s:0.6}pulled this from Judgement? fish for Dagger.{}'
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = { extra = {cards = 30 }},
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.cards } }
    end,
    pos = {x = 6, y = 0},
	calculate = function(self, card, context)
        if context.selling_self then
            for i=1, math.floor(card.ability.extra.cards), 1 do
            create_playing_card({front = pseudorandom_element(G.P_CARDS, pseudoseed('birthrate')), center = G.P_CENTERS.m_bonus}, G.deck, nil, nil, {G.C.BLUE})
            end
            return {
                message = "+30 Cards",
                colour = G.C.BLUE,
                playing_cards_created = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}
                -- TODO: DO THIS PROPERLY
            }
        end
    end
}
