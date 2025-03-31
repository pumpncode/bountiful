SMODS.Joker{
    key = 'beast',
    loc_txt = {
        name = 'Beast Card',
        text = {
            '{C:mult}Mult{} cards give {C:mult}+8{} Mult',
            '{C:green}#1# in 4{} chance to make',
            'a {C:mult}Mult{} card when card ',
            'destroyed or sold',
            '{s:0.6}reference? i don\'t see it{}'
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    pos = {x = 8, y = 1},
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1)}}
    end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_mult") then
            return {
                mult = 8
            }
            end
        end
        if (context.selling_card or context.remove_playing_cards) and pseudorandom('b') < G.GAME.probabilities.normal/4 then
            create_playing_card({front = pseudorandom_element(G.P_CARDS, pseudoseed('beast')), center = G.P_CENTERS.m_mult}, G.deck, nil, nil, {G.C.BLUE})
            return {
                message = "+1 Mult Card",
                colour = G.C.RED,
                playing_cards_created = {true}
            }
        end
    end
}