SMODS.Joker{
    key = 'boardandspilikins',
    loc_txt = {
        name = 'Board and Spilikins',
        text = {
            'Played {C:attention}5s{} give {C:mult}+15{} Mult',
            'when scored if played',
            'hand contains a {C:attention}Jack{}',
            '{s:0.6}even unscoring Jacks, yes.{}'
        },
    },
    atlas = 'jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { mult = 15 }},
    pos = {x = 1, y = 0},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('suggested by @ironic_', G.C.BLACK, G.C.WHITE, 0.8 )
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local rank = context.other_card:get_id()
            for i=1, #context.full_hand do
                if context.full_hand[i]:get_id() == 11 and rank == 5 then
                   return {
                      mult = card.ability.extra.mult
                   }
                end
            end
        end
    end
}
