BOUNTIFUL = {}

SMODS.Atlas{
   key = 'jokers',
   path = 'atlas.png',
   px = 71,
   py = 95
}

SMODS.Atlas{
   key = 'crossmods',
   path = 'crossmodatlas.png',
   px = 71,
   py = 95
}

SMODS.Atlas{
   key = 'blind',
   path = 'blind.png',
   px = 34,
   py = 34,
   frames = 21,
   atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Atlas {
   key = "modicon",
   path = "icon.png",
   px = 34,
   py = 34
}

BOUNTIFUL.enabledJokers = {
'babel',
'baitandswitch',
'bakingsoda',
'balancing',
'ballot',
'bamboo',
'banderole',
'barley',
'baseten',
'basicity',
'bastedegg',
'battery',
'beast',
'bechdel',
'beneficiary',
'bill',
'binder',
'bismuth',
'bitshift',
'blackmail',
'blahaj',
'blatant',
'boardandspilikins',
'boarding_ticket',
'bobber',
'botched',
'bottom_quark',
'bourgeoisie',
'brake',
'brokerdealer',
'bulletin'
}

if not G.P_CENTER_POOLS["Food"] then
   SMODS.ObjectType {
      key = "Food",
      default = "j_gros_michel",
      cards = {},
      inject = function(self)
         SMODS.ObjectType.inject(self)
         self:inject_card(G.P_CENTERS.j_cavendish)
         self:inject_card(G.P_CENTERS.j_diet_cola)
         self:inject_card(G.P_CENTERS.j_egg)
         self:inject_card(G.P_CENTERS.j_gros_michel)
         self:inject_card(G.P_CENTERS.j_ice_cream)
         self:inject_card(G.P_CENTERS.j_popcorn)
         self:inject_card(G.P_CENTERS.j_ramen)
         self:inject_card(G.P_CENTERS.j_selzer)
         self:inject_card(G.P_CENTERS.j_turtle_bean)
      end,
   }
end

for i = 1, #BOUNTIFUL.enabledJokers do
   pcall(function()
      return NFS.load(SMODS.current_mod.path .. '/joker/' .. BOUNTIFUL.enabledJokers[i] .. '.lua')()
   end)
end

assert(SMODS.load_file('challenges.lua'))()
assert(SMODS.load_file('decks.lua'))()
assert(SMODS.load_file('blinds.lua'))()

to_number = to_number or function(x) return x end

if next(SMODS.find_mod("pta_saka")) then
   pcall(function()
      return NFS.load(SMODS.current_mod.path .. '/crossmods/haya.lua')()
   end)
end
