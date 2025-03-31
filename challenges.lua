-- banner challenge
SMODS.Challenge{
    loc_txt = "Banner Advertising",
    key = 'banner',
    rules = {
        custom = {
            {id = 'no_extra_hand_money'},
        },
        modifiers = {
            {id = 'dollars', value = 6},
            {id = 'hands', value = 1},
            {id = 'joker_slots', value = 6}, -- simulate black deck
        },
    },
    jokers = {
        {id = 'j_banner', eternal = true, pinned = true},
        {id = 'j_drunkard', eternal = false, pinned = true},
        {id = 'j_banner', eternal = true, pinned = true},
    },
    restrictions = {
        banned_cards = {
            {id = 'v_petroglyph'},
        },
        banned_tags = {{id = 'tag_garbage'}}
    }
}

-- blue_joker challenge
SMODS.Challenge{
    loc_txt = "Blue Moon",
    key = 'blue_joker',
    rules = {
        custom = {
        },
        modifiers = {
        },
    },
    restrictions = {
        banned_cards = {
            {id = 'j_sly'},
            {id = 'j_wily'},
            {id = 'j_clever'},
            {id = 'j_devious'},
            {id = 'j_crafty'},
            {id = 'j_banner'},
            {id = 'j_scary_face'},
            {id = 'j_odd_todd'},
            {id = 'j_scholar'},
            {id = 'j_runner'},
            {id = 'j_ice_cream'},
            {id = 'j_hiker'},
            {id = 'j_square'},
            {id = 'j_stone'},
            {id = 'j_bull'},
            {id = 'j_walkie_talkie'},
            {id = 'j_castle'},
            {id = 'j_arrowhead'},
            {id = 'j_wee'},
            {id = 'j_stuntman'},
            {id = 'j_mime'},
            {id = 'j_hack'},
            {id = 'j_selzer'},
            {id = 'j_sock_and_buskin'},
            {id = 'j_hanging_chad'},
            {id = 'j_marble'},
            {id = 'j_splash'},
            {id = 'j_astronomer'},
            {id = 'j_burnt'},
            {id = 'j_space'},
            {id = 'c_high_priestess'},
            {id = 'c_heirophant'},
            {id = 'c_tower'},
            {id = 'c_mercury'},
            {id = 'c_venus'},
            {id = 'c_earth'},
            {id = 'c_mars'},
            {id = 'c_jupiter'},
            {id = 'c_saturn'},
            {id = 'c_uranus'},
            {id = 'c_neptune'},
            {id = 'c_pluto'},
            {id = 'c_planet_x'},
            {id = 'c_ceres'},
            {id = 'c_eris'},
            {id = 'c_black_hole'},
            {id = 'j_bbb_botched'},
            {id = 'j_bbb_ballot'},
            {id = 'j_bbb_beneficiary'},
            {id = 'j_bbb_bechdel'},
            {id = 'j_bbb_basicity'},
            {id = 'p_celestial_normal_1', ids = {
                'p_celestial_normal_1','p_celestial_normal_2','p_celestial_normal_3','p_celestial_normal_4','p_celestial_jumbo_1','p_celestial_jumbo_2','p_celestial_mega_1','p_celestial_mega_2',
            }},
        },
        banned_tags = {{id = 'tag_foil'}, {id = 'tag_meteor'}, {id = 'tag_orbital'}}
    },
    jokers = {
        {id = 'j_blue_joker', eternal = true},
    },
    deck = {
    }
}

-- blackboard challenge
SMODS.Challenge{
    loc_txt = "Broken Chalk",
    key = 'blackboard',
    rules = {
        custom = {
            {id = 'discard_cost', value = 2},
        },
        modifiers = {
            {id = 'dollars', value = 6},
            {id = 'hands', value = 2},
            {id = 'discards', value = 10},
            {id = 'joker_slots', value = 4},
        },
    },
    restrictions = {
        banned_tags = {{id = 'tag_garbage'}}
    },
    jokers = {
        {id = 'j_blackboard', eternal = true},
    },
    deck = {
        no_suits = {D = true}
    }
}

-- bloodstone challenge
SMODS.Challenge{
    loc_txt = "Bleeding Out",
    key = 'bloodstone',
    rules = {
        custom = {
            {id = 'debuff_played_cards'},
        },
        modifiers = {
            {id = 'dollars', value = 15},
            {id = 'discards', value = 4},
        },
    },
    jokers = {
        {id = 'j_bloodstone', eternal = true},
    },
    deck = {
        cards = {
            { s = "H", r = "K" },
            { s = "H", r = "Q" },
            { s = "H", r = "J" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "H", r = "A" },
            { s = "H", r = "K" },
            { s = "H", r = "Q" },
            { s = "H", r = "J" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "H", r = "A" },
            { s = "H", r = "K" },
            { s = "H", r = "Q" },
            { s = "H", r = "J" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "H", r = "A" },
            { s = "H", r = "K" },
            { s = "H", r = "Q" },
            { s = "H", r = "J" },
            { s = "H", r = "T" },
            { s = "H", r = "9" },
            { s = "H", r = "8" },
            { s = "H", r = "7" },
            { s = "H", r = "6" },
            { s = "H", r = "5" },
            { s = "H", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "2" },
            { s = "H", r = "A" },
        }
    }
}

-- baseball challenge
SMODS.Challenge{
    loc_txt = "Back-to-back Homers",
    key = 'baseball',
    rules = {
        custom = {
            {id = 'no_interest'},
            {id = 'set_eternal_ante', value = 6},
        },
        modifiers = {
            {id = 'joker_slots', value = 7},
        }
    },
    jokers = {
        {id = 'j_baseball', eternal = true},
        {id = 'j_baseball', eternal = true},
    },
    consumeables = {
        {id = 'c_judgement'},
        {id = 'c_judgement'},
        {id = 'c_judgement'},
        {id = 'c_judgement'},
        {id = 'c_judgement'}
    },
    restrictions = {
        banned_cards = {
            {id = 'j_greedy_joker'},
            {id = 'j_lusty_joker'},
            {id = 'j_wrathful_joker'},
            {id = 'j_gluttenous_joker'},
            {id = 'j_jolly'},
            {id = 'j_zany'},
            {id = 'j_mad'},
            {id = 'j_crazy'},
            {id = 'j_droll'},
            {id = 'j_sly'},
            {id = 'j_wily'},
            {id = 'j_clever'},
            {id = 'j_devious'},
            {id = 'j_crafty'},
            {id = 'j_half'},
            {id = 'j_credit_card'},
            {id = 'j_banner'},
            {id = 'j_mystic_summit'},
            {id = 'j_8_ball'},
            {id = 'j_misprint'},
            {id = 'j_raised_fist'},
            {id = 'j_chaos'},
            {id = 'j_scary_face'},
            {id = 'j_abstract'},
            {id = 'j_delayed_grat'},
            {id = 'j_gros_michel'},
            {id = 'j_even_steven'},
            {id = 'j_odd_todd'},
            {id = 'j_scholar'},
            {id = 'j_business'},
            {id = 'j_supernova'},
            {id = 'j_ride_the_bus'},
            {id = 'j_egg'},
            {id = 'j_runner'},
            {id = 'j_ice_cream'},
            {id = 'j_dna'},
            {id = 'j_splash'},
            {id = 'j_blue_joker'},
            {id = 'j_faceless'},
            {id = 'j_green_joker'},
            {id = 'j_superposition'},
            {id = 'j_todo_list'},
            {id = 'j_cavendish'},
            {id = 'j_red_card'},
            {id = 'j_square'},
            {id = 'j_riff_raff'},
            {id = 'j_vagabond'},
            {id = 'j_baron'},
            {id = 'j_obelisk'},
            {id = 'j_photograph'},
            {id = 'j_reserved_parking'},
            {id = 'j_mail'},
            {id = 'j_hallucination'},
            {id = 'j_fortune_teller'},
            {id = 'j_juggler'},
            {id = 'j_drunkard'},
            {id = 'j_golden'},
            {id = 'j_popcorn'},
            {id = 'j_ancient'},
            {id = 'j_walkie_talkie'},
            {id = 'j_smiley'},
            {id = 'j_campfire'},
            {id = 'j_ticket'},
            {id = 'j_swashbuckler'},
            {id = 'j_hanging_chad'},
            {id = 'j_blueprint'},
            {id = 'j_wee'},
            {id = 'j_hit_the_road'},
            {id = 'j_duo'},
            {id = 'j_trio'},
            {id = 'j_family'},
            {id = 'j_order'},
            {id = 'j_tribe'},
            {id = 'j_stuntman'},
            {id = 'j_invisible'},
            {id = 'j_brainstorm'},
            {id = 'j_shoot_the_moon'},
            {id = 'j_drivers_license'},
            {id = 'j_burnt'},
            {id = 'j_caino'},
            {id = 'j_triboulet'},
            {id = 'j_yorick'},
            {id = 'j_chicot'},
            {id = 'j_perkeo'},
            {id = 'j_bbb_brokerdealer'},
            {id = 'j_bbb_bechdel'},
            {id = 'j_bbb_beneficiary'},
            {id = 'j_bbb_bastedegg'},
            {id = 'j_bbb_basicity'},
            {id = 'j_bbb_botched'},
            {id = 'j_bbb_bakingsoda'},
            {id = 'c_wraith'},
            {id = 'c_soul'},
        },
        banned_tags = {{id = "tag_top_up"},{id = "tag_rare"}},
        banned_other = {
        }
    }
}

-- bootstraps challenge
SMODS.Challenge{
    loc_txt = "Booting BIOS",
    key = 'bootstraps',
    rules = {
        custom = {
            {id = 'chips_dollar_cap'},
        },
        modifiers = {
            {id = 'dollars', value = 20},
            {id = 'hands', value = 5},
            {id = 'discards', value = 5},
        },
    },
    restrictions = {
    },
    jokers = {
        {id = 'j_bootstraps', eternal = true},
    },
    deck = {
    }
}

-- baron challenge
SMODS.Challenge{
    loc_txt = "Baron and Empire",
    key = 'baron',
    rules = {
        custom = {
            {id = 'no_extra_hand_money'},
            {id = 'debuff_played_cards'},
            {id = 'set_eternal_ante', value = 4},
            {id = 'set_joker_slots_ante', value = 6},
        },
        modifiers = {
            {id = 'hands', value = 1},
            {id = 'consumable_slots', value = 0},
        }
    },
    jokers = {
        {id = 'j_baron'},
        {id = 'j_baron', eternal = true},
        {id = 'j_baron'},
    },
    consumeables = {
        {id = 'c_temperance'},
        {id = 'c_judgement'},
        {id = 'c_hermit'},
        {id = 'c_deja_vu'},
    },
    restrictions = {
        banned_cards = {
            {id = 'j_mime'},
        },
        banned_tags = {},
        banned_other = {
            {id = 'bl_club', type = 'blind'},
            {id = 'bl_window', type = 'blind'},
            {id = 'bl_final_leaf', type = 'blind'},
        }
    },
    deck = {
        cards = {
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "H", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "S", r = "K" },
            { s = "H", r = "J" },
            { s = "H", r = "J" },
            { s = "S", r = "J" },
            { s = "S", r = "J" },
            { s = "H", r = "J" },
            { s = "H", r = "J" },
            { s = "S", r = "J" },
            { s = "S", r = "J" },
            { s = "H", r = "7" },
            { s = "H", r = "7" },
            { s = "S", r = "7" },
            { s = "S", r = "7" },
            { s = "H", r = "7" },
            { s = "H", r = "7" },
            { s = "S", r = "7" },
            { s = "S", r = "7" },
            { s = "H", r = "4" },
            { s = "H", r = "4" },
            { s = "S", r = "4" },
            { s = "S", r = "4" },
            { s = "H", r = "4" },
            { s = "H", r = "4" },
            { s = "S", r = "4" },
            { s = "S", r = "4" },
            { s = "H", r = "3" },
            { s = "H", r = "3" },
            { s = "S", r = "3" },
            { s = "S", r = "3" },
            { s = "H", r = "3" },
            { s = "H", r = "3" },
            { s = "S", r = "3" },
            { s = "S", r = "3" },
        }
    }
}

-- blueprint challenge
SMODS.Challenge{
    loc_txt = "Blaupause",
    key = 'blueprint',
    rules = {
        custom = {
            {id = 'flipped_cards', value = 4},
        },
        modifiers = {
            {id = 'dollars', value = 0},
            {id = 'joker_slots', value = 4}
        },
    },
    jokers = {
        {id = 'j_stencil', eternal = false, pinned = false},
        {id = 'j_blueprint', eternal = false, pinned = true},
        {id = 'j_blueprint', eternal = true, pinned = true},
        {id = 'j_blueprint', eternal = true, pinned = true},
    }
}

-- beneficiary challenge
SMODS.Challenge{
    loc_txt = "Bonus Content",
    key = 'beneficiary',
    rules = {
        custom = {
            {id = 'no_extra_hand_money'},
        },
        modifiers = {
            {id = 'dollars', value = 0},
            {id = 'hands', value = 7},
            {id = 'discards', value = 0},
        },
    },
    jokers = {
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
        {id = 'j_bbb_beneficiary'},
    },
    restrictions = {
        banned_cards = {
            {id = 'c_ankh'},
            {id = 'c_hex'},
            {id = 'j_ceremonial'},
            {id = 'j_madness'},
            {id = 'j_erosion'},
        },
        banned_tags = {},
        banned_other = {},
    },
    deck = {
        enhancement = "m_bonus"
    }
}

-- bourgeoisie challenge
SMODS.Challenge{
    loc_txt = "Bourgeois",
    key = 'bourgeoisie',
    rules = {
        custom = {
            {id = 'no_interest'},
            {id = 'no_extra_hand_money'},
            {id = 'no_reward'}
        },
        modifiers = {
            {id = 'dollars', value = 0},
        }
    },
    jokers = {
        {id = 'j_bbb_bourgeoisie', eternal = true, pinned = true},
    },
    restrictions = {
        banned_cards = {
            {id = 'c_hermit'},
            {id = 'c_immolate'},
            {id = 'v_clearance_sale'},
            {id = 'v_liquidation'},
            {id = 'v_reroll_surplus'},
            {id = 'v_reroll_glut'},
            {id = 'v_seed_money'},
            {id = 'v_money_tree'},
        },
        banned_tags = {
            {id = 'tag_economy'}
        },
        banned_other = {},
    },
    deck = {
        cards = {
            { s = "C", r = "J" },
            { s = "C", r = "6" },
            { s = "D", r = "J" },
            { s = "D", r = "6" },
            { s = "H", r = "J" },
            { s = "H", r = "6" },
            { s = "S", r = "J" },
            { s = "S", r = "6" },
            { s = "C", r = "7" },
            { s = "C", r = "7" },
            { s = "D", r = "7" },
            { s = "D", r = "7" },
            { s = "H", r = "7" },
            { s = "H", r = "7" },
            { s = "S", r = "7" },
            { s = "S", r = "7" },
            { s = "C", r = "8" },
            { s = "C", r = "8" },
            { s = "D", r = "8" },
            { s = "D", r = "8" },
            { s = "H", r = "8" },
            { s = "H", r = "8" },
            { s = "S", r = "8" },
            { s = "S", r = "8" },
            { s = "C", r = "9" },
            { s = "C", r = "9" },
            { s = "D", r = "9" },
            { s = "D", r = "9" },
            { s = "H", r = "9" },
            { s = "H", r = "9" },
            { s = "S", r = "9" },
            { s = "S", r = "9" },
            { s = "C", r = "T" },
            { s = "C", r = "T" },
            { s = "D", r = "T" },
            { s = "D", r = "T" },
            { s = "H", r = "T" },
            { s = "H", r = "T" },
            { s = "S", r = "T" },
            { s = "S", r = "T" },
        }
    }
}
