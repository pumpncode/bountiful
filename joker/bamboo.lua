SMODS.Joker{
    key = 'bamboo',
    loc_txt = {
        name = 'Bamboo',
        text = {
            'Creates a {C:attention}Bamboo{} with ',
            'a higher chance of an',
            '{C:enhanced}edition{} when blind selected',
            '{C:inactive}(Must have room){}',
        },
    },
    atlas = 'jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { justcreated = 1 }},
    pos = {x = 7, y = 3},
    calculate = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.justcreated = 0
        end
        if context.setting_blind and card.ability.extra.justcreated == 0 and (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit and not context.blueprint then
            if pseudorandom('bamboo') > 0.5 then
                SMODS.add_card{ key = "j_bbb_bamboo", area = G.jokers, edition = poll_edition('tag', nil, false, true) }
            else
                SMODS.add_card{ key = "j_bbb_bamboo", area = G.jokers }
            end
        end
    end
}