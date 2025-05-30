SMODS.Joker{
    key = 'bobber',
    loc_txt = {
        name = 'Bobber',
        text = {
            '{X:mult,C:white}x#1#{} Mult if cards',
            '{C:attention}held in hand{} do not',
            'contain a {C:attention}Pair{}',
            '{s:0.6}fish for your cards slowly{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { allow = false, xmult = 3, pool = {}}},
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    pos = {x = 7, y = 2},
	calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.allow = true
            card.ability.extra.pool = {}
        end
        if context.cardarea == G.hand and context.individual then
            if context.other_card:get_id() >= 2 and context.other_card:get_id() <= 14 then
                for _, v in pairs(card.ability.extra.pool) do
                    if v == context.other_card:get_id() then
                        card.ability.extra.allow = false
                    end
                end
                if card.ability.extra.allow == true then
                    table.insert(card.ability.extra.pool, context.other_card:get_id())
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.allow == true then
                card.ability.extra.pool = {}
                return {
                    Xmult = card.ability.extra.xmult,
                }
            else
                card.ability.extra.allow = true
                card.ability.extra.pool = {}
            end
        end
    end
}
