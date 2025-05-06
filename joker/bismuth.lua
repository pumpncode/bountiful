SMODS.Joker{
    key = 'bismuth',
    loc_txt = {
        name = 'Bismuth',
        text = {
            '{C:red}-1{} hand',
            'If {C:attention}first discard{} of round has',
            'only {C:attention}1{} card, apply {C:dark_edition}Polychrome{}',
            'to the {C:attention}discarded{} playing card,',
            '{s:0.6}the gay teen amongst the toxic family.{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    pos = {x = 5, y = 0},
	calculate = function(self, card, context)
        if context.first_hand_drawn and  G.GAME.current_round.hands_left > 1 and not context.blueprint then
            G.GAME.current_round.hands_left = math.min(1, G.GAME.current_round.hands_left - 1)
            return {
                message = '-1 Hand!',
                colour = G.C.RED
            }
        end
        if context.discard and not context.blueprint then
            if #G.hand.highlighted == 1 and G.GAME.current_round.discards_used <= 0 then
                context.other_card:set_edition('e_polychrome', 1, 1)
                return {
                    message = 'Poly\'d!',
                    colour = G.C.EDITION
                }
            end
        end
    end
}