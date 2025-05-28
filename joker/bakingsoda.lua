SMODS.Joker{
    key = 'bakingsoda',
    loc_txt = {
        name = 'Baking Soda',
        text = {
        '{C:attention}Plays and retriggers{}',
        'unscored cards',
        '{C:inactive}#1#g left{}',
        '{s:0.6}sodium bicarbonate.{}'
        }
    },
    atlas = 'jokers',
    pos = {
        x = 2,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
            g = 455,
        }
    },
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.g }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @meptune', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            for i=1, #context.full_hand do
                context.full_hand[i].retrigger = true
                for j=1, #context.scoring_hand do
                   if context.scoring_hand[j] == context.full_hand[i] then 
                      context.full_hand[i].retrigger = false
                   else
            end end end
            return {
                add_to_hand = true
            }
        end
        if context.repetition and not context.repetition_only and card.ability.extra.g > 0 then
            if context.other_card.retrigger == true then
                card.ability.extra.g = card.ability.extra.g - 5
                card_eval_status_text(card, "extra", nil, nil, nil,
                    { message = '-5 g!' }
                )
                return {
                    message = 'Again!',
                    repetitions = 1,
                    card = context.other_card,
                }
            end
        end
    end
}
