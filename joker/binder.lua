SMODS.Joker{
    key = 'binder',
    loc_txt = {
        name = 'Binder',
        text = {
            'Converts scoring',
            '{C:attention}Queens{} into {C:attention}Kings{}',
            '{s:0.6}Art reference was my own!{}'
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
    pos = {x = 5, y = 2},
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local recall = context.other_card:get_id()
            if recall == 12 then
                assert(SMODS.change_base(context.other_card, nil, 'King'))
                return {
                    message = 'King me!'
                }
            end
        end
    end
}