SMODS.Joker{
    key = 'bulletin',
    loc_txt = {
        name = 'Bulletin',
        text = {
            'Copies ability of',
            '{C:attention}Joker{} to the right',
            '{C:red}Debuffs random Joker{}',
            '{s:0.8}Changes when blind is selected{}',
            '{s:0.6}waow, #1#{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.compat or "compatible, cool."
            }
        }
    end,
	config = { extra = { compat = 'compatible, cool.'}},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @ctlaserdisc', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
    pos = {x = 7, y = 0},
    update = function(self, card, dt)
        if G.jokers ~= nil then
            for i=1, #G.jokers.cards do
            if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
                if G.jokers.cards[i+1].config.center.blueprint_compat then
                        card.ability.extra.compat = 'compatible, cool.'
                else
                    card.ability.extra.compat = 'incompatible, huge L'
        end end end end
    end,
    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
            for i=1, #G.jokers.cards do
                    local joker = G.jokers.cards[i]
                    SMODS.debuff_card(joker, false, "b_bulletin")
        end end
        if context.setting_blind and context.cardarea == G.jokers and #G.jokers.cards > 1 and not context.blueprint then
            local pool = {}
            for v, k in ipairs(G.jokers.cards) do
                if k ~= card then
                    pool[#pool + 1] = k
                end end
            local joker = pseudorandom_element(pool, pseudoseed('bulletin'))
                SMODS.debuff_card(joker, true, "b_bulletin")
            return {
                message = "Debuffed!",
                card = card,
                colour = G.C.RED,
                copy = 1 }
        end
        for i=1, #G.jokers.cards do
            if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
                local ret = SMODS.blueprint_effect(card, G.jokers.cards[i+1], context)
                if ret then
                    ret.colour = G.C.RED
                    ret.card = context.blueprint_card or card
                    return ret
        end end end
    end
}
