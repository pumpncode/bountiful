SMODS.Joker{
    key = 'bitshift',
    loc_txt = {
        name = 'Bit Shift',
        text = {
            'Halves the rank of',
            '{C:attention}non-face cards{}',
            '{s:0.6}so yes, it rounds down.{}'
        },
    },
    atlas = 'jokers',
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 1},
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local recall = context.other_card:get_id()
            if recall == 14 then
                context.other_card.b_ace = true
                return {
                    message = '>> 0?'
                }
            end
            if recall <= 10 and recall >= 4 then
                local res = math.ceil(recall/2)
                assert(SMODS.change_base(context.other_card, nil, tostring(res)))
                return {
                    message = '>> '..res
                }
            end
            if recall == 2 or recall == 3 then
                assert(SMODS.change_base(context.other_card, nil, 'Ace'))
                return {
                    message = '>> 1'
                }
            end
        end
        if context.destroying_card and context.destroying_card.b_ace == true then
            return {
                remove = true,
            }
        end
    end
}