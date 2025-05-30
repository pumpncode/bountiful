SMODS.Joker{
    key = 'battery',
    loc_txt = {
        name = 'Battery',
        text = {
        'Played {C:attention}5s{} gain',
        '{X:mult,C:white}X#1#{} Mult',
        '{s:0.6}go my nubby{}'
        }
    },
    atlas = 'jokers',
    pos = { x = 0, y = 3 },
    rarity = 3,
    cost = 4,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { extra = { x_mult = 0.04 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.x_mult }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #G.play.cards do
                local other_card = G.play.cards[i]
                if other_card:get_id() == card.ability.extra.rank then
                    other_card.ability.perma_x_mult = (other_card.ability.perma_x_mult or 0) + card.ability.extra.x_mult
                    other_card:juice_up()
                end
            end
            return {
                message = '+X'..card.ability.extra.x_mult,
                colour = G.C.MULT,
            }
        end
    end
}
