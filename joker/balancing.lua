SMODS.Joker{
    key = 'balancing',
    loc_txt = {
        name = 'Balancing Act',
        text = {
            '{C:blue}+#1#{} hands and {C:red}+#2#{} discards',
            '{C:attention}Turns{} a {C:blue}hand{} into a {C:red}discard{}',
            'when a {C:blue}hand{} is played and',
            'vice versa for {C:red}discards{}',
            '{s:0.6}tip the scales, split the room{}'
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
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.hands, card.ability.extra.discard }
        }
    end,
    config = { extra = { hands = 2, discard = 3, first = 0 }},
    pos = {x = 6, y = 1},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @normalben', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
	calculate = function(self, card, context)
        if context.setting_blind then
            ease_discard(card.ability.extra.discard)
            ease_hands_played(card.ability.extra.hands)
            card.ability.extra.first = 1
            return{
                message = 'Equal!'
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left > 1 and card.ability.extra.hands > 0 and card.ability.extra.first == 1 then
            ease_discard(1)
            ease_hands_played(-1)
            card.ability.extra.discard = card.ability.extra.discard + 1
            card.ability.extra.hands = card.ability.extra.hands - 1
            return{
                message = 'Tipped!'
            }
        end
        if context.pre_discard and G.GAME.current_round.discards_left > 1 and card.ability.extra.discard > 0 and card.ability.extra.first == 1 then
            ease_discard(-1)
            ease_hands_played(1)
            card.ability.extra.discard = card.ability.extra.discard - 1
            card.ability.extra.hands = card.ability.extra.hands + 1
            return{
                message = 'Tipped!'
            }
        end
        if (context.selling_card or context.remove_playing_cards) and context.card == card and context.cardarea == G.play then
            ease_discard(-card.ability.extra.discard)
            ease_hands_played(-card.ability.extra.hands)
        end
    end
}