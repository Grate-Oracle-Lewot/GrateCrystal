# Pokémon Grate Crystal

Repository: https://github.com/Grate-Oracle-Lewot/GrateCrystal

Recommended RGBDS version: 0.5.2

Recommended Emulator: BGB

*Not link-compatible or save-swappable with unaltered Crystal Version*

This is an edit of the pret community's "pokecrystal" disassembly on GitHub—in other words, a Pokémon Crystal romhack. It's called "Grate" Crystal because the editing (but not the original disassembling) was done by me, the Grate Oracle Lewot. There's not much of a theme to this project—it's about 1/3 joke hack, 1/3 "what I would actually change about Crystal," and 1/3 "how far can I push my hacking abilities?" I'll list most of the changes below, but I'm bound to miss more than a few details, so consider the list non-exhaustive.

# Pokémon removed

- Pichu (still cameos in the intro cinematic)
- Cleffa
- Igglybuff
- Smoochum
- Elekid
- Magby

# Pokémon added

- Cottonee
- Whimsicott
- Yanmega
- 5 new Pokémon based on unused beta designs, one of which is legendary

# Major Edits

- Fairy type added
- Physical/Special split
- TMs are infinite-use
- Nayru62's advanced Pokédex shows base stats, learnsets, encounter rates, and much more
- Time Capsule replaced with player gender swap machine
- Poké Seer replaced with move reminder
- Egg move tutor unlockable in Kanto
- Text scrolls automatically in battle (and at a few other key points)
- Run at bike speed by holding B (no effect on wild encounter rate or spinning trainers); brake on Cycling Road by holding B
- Greatly increased pack and PC storage space, including a separate "Fruit" pocket for Berries and Apricorns, and doubled space for phone numbers in the Pokégear
- Berry and Apricorn trees now give out 5 at a time, as do phone contacts who give Berries
- Special encounters for all legendary Pokémon, some of which respawn after beating the League if you didn't catch them the first time
- Slight increase to all experience gains, and experience is now gained from catching Pokémon
- Double stat exp gained from battles, 1.9x from vitamins, and vitamins now keep working until near max stat exp
- A completely different Elite Four based on me and my friends/family (Lance is still the Champion)
- X items (X Attack, X Defend, etc.) now activate automatically if held in battle
- Pseudo-Abilities:
  - Pokémon that would/should have Levitate are given a similar Ground immunity, but certain Ground moves still work on them, like Bone Club and Mud-Slap; an up arrow is shown to indicate levitation in battle and on the stats screen
  - All Electric types have a 30% chance to Paralyze attackers on contact (but Ground types are immune to this)
  - All Fairy types have a 30% chance to infatuate opposite-gender attackers on contact (but Dark types are immune to this)
  - All Grass types get a 50% Speed boost in Sunny weather
  - All Rock types get a 50% Special Defense boost in Sandstorms
  - All Ice types get a 50% Defense boost in Hail
  - Fire types are immune to being Frozen
  - Water types are immune to being Burned
  - Steel types are immune to being Poisoned (mostly redundant, but previously Twineedle could do it; this feature is now available [as a tutorial](https://github.com/pret/pokecrystal/wiki/Prevent-Steel%E2%80%90types-from-being-poisoned-by-Twineedle))
  - Psychic types are immune to flinching
  - Dragon types are immune to critical hits
  - Ghost types are immune to Mean Look and Spider Web (they can still be trapped by Fire Spin, etc.)
  - Fighting types don't lose Attack while Burned
  - Flying types don't lose Speed while Paralyzed
  - We can count Shuckle's ability to make Berry Juice, which is now a much better item
  - Miltank can produce Moomoo Milk in the same manner as Shuckle fermenting Berries (in this case it needs an empty held item slot)
- Overhaul of Pokémon learnsets, egg moves, breeding groups, encounter locations, encounter levels, enemy trainer parties, wild held items, some base stats, etc.
  - Ditto is now the fastest Pokémon, letting it Transform before getting hit, and it can also learn a small number of TM moves
  - Unown and Delibird learn multiple moves
  - All learnsets are generally more interesting, containing what would normally be egg moves (and more), while egg moves now go even farther
  - All non-legendary Pokémon can be obtained prior to the Pokémon League
  - Enemy trainer parties are more diverse and generally stronger, and new trainers are found throughout the game
  - All items are more widely available, either in shops, as wild held items, or things like Beuna's Password prizes
  - Trade evolutions have all been replaced with other methods, making them more easily obtainable in a ROM
  - Any Pokémon that received a new evolution in a later generation has its base stats increased to about halfway between its original stats and those of its evolution, to compensate for the evolutions not being present
  - All Pokémon that only belonged to one Egg Group now belong to two, Ditto can breed with itself, and legendaries can now breed with Ditto (except for Mewtwo)
- Mr. Pokémon is now named Pokey Man. After defeating Blue, you can battle Prof. Oak at Pokey Man's house once per day, and if you win, Pokey Man will give you another Odd Egg (or if you have Mewtwo in your party at the time, a Mewtwo egg)
- If you have all 16 Badges, you can fight former Elite Four members in a secondary gauntlet at the Cianwood Photo Studio
- New Pokédex entries for every Pokémon
- A few Pokémon have been reverted to their beta designs, a few have palette changes to reflect their type changes (see below), some shiny palettes changed for various reasons, and Butterfree and Venomoth have had their sprites swapped
- Unused mine cart graphics added to some caves
- All of the rival's dialogue has been replaced with that from the Vietnamese Crystal bootleg

## Type chart changes
- Fairy merely resists Dragon instead of being totally immune
- Ice now resists Fairy and Flying
- Bug now resists Psychic, is no longer bad against Fire or Ghost, and is now bad against Rock
- Steel no longer resists Ghost or Psychic (but does still resist Dark)
- Graph: https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/gfx/typechart.png

## Pokémon type changes
- Rattata/Raticate: Normal -> Normal/Dark
- Spearow/Fearow: Normal/Flying -> Flying
- Pikachu has six forms, determined by DVs (like Unown letters):
  - Retro (uses Gen I sprites): pure Electric
  - Silver (animated Silver Version sprite): Electric/Normal
  - Crystal (normal Crystal Version sprite): Electric/Fairy
  - Fighting (kicking pose from Yellow Version intro): Electric/Fighting
  - Surfing (surfboard sprite from Yellow Version intro): Electric/Water
  - Flying (balloons sprite from Yellow Version intro): Electric/Flying
- Ekans/Arbok: Poison -> Poison/Dark
- Vulpix/Ninetales: Fire -> Fire/Ice
- Meowth/Persian: Normal -> Normal/Steel
- Golduck: Water -> Water/Psychic
- Mankey/Primape: Fighting -> Fighting/Dark
- Ponyta/Rapidash: Fire -> Fire/Fairy
- Slowpoke: Water/Psychic -> Psychic
- Farfetch'd: Normal/Flying -> Fighting/Flying
- Seel: Water -> Water/Ice
- Shellder/Cloyster: Water(/Ice) -> Water/Steel
- Drowzee/Hypno: Psychic -> Psychic/Dark
- Krabby/Kingler: Water -> Water/Bug
- Marowak: Ground -> Ground/Ghost
- Koffing/Weezing: Poison -> Poison/Fairy
- Rhyhorn/Rhydon: Ground/Rock -> Steel/Rock
- Tangela: Grass -> Grass/Water
- Kangaskhan: Normal -> Normal/Fighting
- Electabuzz: Electric -> Electric/Fighting
- Gyarados: Water/Flying -> Water/Dragon
- Kabuto/Kabutops: Rock/Water -> Rock/Bug
- Mewtwo: Psychic -> Psychic/Fighting
- Noctowl: Normal/Flying -> Ghost/Flying
- Ledyba/Ledian: Bug/Flying -> Bug/Fairy
- Spinarak/Ariados: Bug/Poison -> Bug/Dark
- Ampharos: Electric -> Electric/Dragon
- Politoed: Water -> Water/Ghost
- Sunflora: Grass -> Grass/Fire
- Slowking: Water/Psychic -> Poison/Psychic
- Girafarig: Normal/Psychic -> Normal/Ghost
- Dunsparce: Normal -> Dark/Fairy
- Qwilfish: Water/Poison -> Water/Fire
- Phanpy/Donphan: Ground -> Normal/Ground
- Stantler: Normal -> Normal/Psychic
- Hitmontop: Fighting -> Fighting/Fairy
- Larvitar/Pupitar: Rock/Ground -> Rock/Dark
- Lugia: Psychic/Flying -> Ice/Dragon (Aeroblast is Ice-type too and called "Zeroblast")
- Ho-Oh: Fire/Flying -> Fire/Dragon
- Yanmega: Bug/Flying -> Bug/Dragon
- Unown's type now appears as "???", and it's neutral to all types

## Moves
Check all changes under https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/data/moves/moves.asm

- Removed: Splash, Razor Wind, Barrage, Pain Split, Psywave, Frustration, Constrict, Detect, Poison Gas, Sharpen, Withdraw, Sweet Kiss, Mimic, and Explosion (Selfdestruct is now as strong as Explosion)

- Added: Fairy Wind, Play Rough, Moonblast, Dazzling Gleam (renamed Dazzly Gleam), Dark Pulse, Dragon Pulse, Power Gem, Silver Wind, Signal Beam, Earth Power, Air Slash, Iron Head, Poison Jab, Shadow Claw, Scald, Aura Sphere, Hail, and a new move called Night Terror (a high-power physical Ghost-type move that, like Snore, can only be used while asleep)

- Most moves with a power below 40 have been bumped up to 40 (or 20 for multiple-hit moves). Some other changes to move powers, and almost every move has received an accuracy boost.

- PP rebalanced for most moves.

- Some moves (mostly Normal ones) have had their types changed to allow for better move variety within rarer types.

- HM moves are better in battle, and a few moves have had their effects changed completely. Cut is now basically X-Scissor, Flash is Flash Cannon, Lovely Kiss is Draining Kiss, Hyper Fang also drains HP, Low Kick lowers Evasion, Leer lowers Special Defense, Kinesis sharply raises Special Attack, Cotton Spore sharply lowers Special Attack, Sky Attack flies up on the first turn like Fly and can hit an opponent who's currently flying (and has a 10% flinch chance), etc.

- Nightmare now inflicts both Sleep and the Nightmare status all in one turn. Since this is powerful, it now has low accuracy, but if the target is already asleep, the Nightmare status will be inflicted without fail, just like how the move worked before.

- Hidden Power always has a base power of 70; the type still changes based on DVs, but it can now be Fairy type.

- Tri Attack is now ???-type like Unown, and its effectiveness is based on Fire, Ice, and Electric combined.

- Flame Wheel, Rolling Kick, and Rapid Spin now double in power after you've used Defense Curl. (However, Flame Wheel and Sacred Fire no longer thaw out a Frozen user.)

- Foresight, along with letting Normal and Fighting moves hit Ghost types, now lets Ghost moves hit Normal types and Psychic moves hit Dark types.

- Moves like Earthquake that can hit while the opponent is underground with Dig can now do so even if the digger is Flying-type (or a pseudo-Levitater).

- If you use Substitute whilst already having a Substitute up, it raises both your Defense and Special Defense by one stage each.

- If you use Focus Energy while already pumped, it raises both your Attack and Special Attack by one stage each.

- If you use Spikes while Spikes are already up, it lowers the opponent's Evasion by one stage. This bypasses accuracy checks.

- The effects of Teleport and Baton Pass are combined: either move will act like Teleport in a wild battle and Baton Pass in a trainer battle. Against a wild Pokémon, if the player has more than one party member, either move will act like Baton Pass, but with only one they will act like Teleport. Teleport still has its out-of-battle effect, but Baton Pass doesn't get that.

- Spite always reduces PP by 5.

- Struggle is no longer boosted by the Pink Bow.

## Items
- "Game Boy PC" obtained from Bill in Ecruteak, letting you access the PC anywhere (but you get a "no signal" message inside caves). To balance this, depositing a Pokémon in the PC no longer restores its PP (but does still restore its HP).
- New key items obtained throughout the game that can perform the out-of-battle functions of HM moves without the need for the move (but you still need the corresponding badge)
- New fishing rod, the Odd Rod, hooks rare Pokémon like Omanyte and Kabuto
- New held items that each completely prevent a specific status condition
- "Catch Charm," named after Gen VIII's Catching Charm, here a Pokémon held item that increases catching chance
- Type boost held items now boost their type's power by 19% instead of 10%
- Everstone now also has the effect of Eviolite, boosting defenses of unevolved holders in addition to preventing them from evolving
- King's Rock now adds its flinch chance to all damaging moves, even ones with secondary effects (the exceptions being Future Sight and moves that already have a flinch chance)
- Lucky Punch works for Blissey as well as Chansey
- Sacred Ash can be used even if no party Pokémon are currently fainted
- Most Berries and some other items renamed for flavor
- X Sp. Defend, X Evade, Dusk Ball, and Timer Ball (Timer Ball can tick up to x10 catch chance)
- 60 TMs and 8 HMs
- Itemfinder replaced with consumable versions called Swag Beacons
- The Clear Bell now has the effect of Gen I's Poké Flute when used, waking up all sleeping Pokémon in battle (but it can't be used to wake up Snorlax in the field)
- Removed: Berserk Gene, Metal Powder

## Move tutors

- The one in Goldenrod who teaches Flamethrower, Thunderbolt, and Ice Beam will now teach moves as soon as you defeat Whitney, appears every day instead of just certain days of the week, can teach multiple moves in one day, only charges 2500 coins per move instead of 4000, and can now also teach Tri Attack

- Two new ones in Celadon City: one will teach Sacred Fire in exchange for a Gold Leaf, and one Zeroblast (Aeroblast) for a Silver Leaf

- One in the Ruins of Alph research center will teach Aura Sphere for free once you collect all forms of Unown

## Game Corner prize Pokémon

- Johto: Abra Lv10 (500C), Porygon Lv10 (1000C), Wobbuffet Lv20 (1500C)

- Kanto: Porygon2 Lv40 (4000C), Togetic Lv50 (5000C), Dragonite Lv60 (9999C)

## Locations
- Viridian Forest
- Old layout for Viridian Gym, but with new Lego tiles
- Pewter Museum (fossils can be resurrected at Lv.1, with a random chance to start in their evolved form, e.g. Kabutops instead of Kabuto)
- Silph Co. (similar layout to Gen I, no Rockets; defeat the Chief for endless free Up-Grades)
- A second floor to the Power Plant (similar layout to Gen I, no wild encounters; navigate to find the Manager, with optional battles against Engineers)
- An abandoned version of the Safari Zone
- A room linking Union Cave and Slowpoke Well together
- An extra room in Dark Cave
- A backroom to the Goldenrod Game Corner where you can battle Gamblers whose Pokémon are high-level but use luck-based moves like one-hit-KOs or Metronome
- A version of Seafoam Cave hosting a final, all-Lv100 battle against me (unlocked by beating Red)
- A house on Route 22 where different characters appear, most of whom can be battled once per day
  - Monday: Koga, who now uses Fairy types instead of Poison
  - Tuesday: Officer Jenny; no battle, but she gives out 6 Rare Candies (or 6 PP Ups if you've beaten Red)
  - Wednesday: Jessie and James, with their Pokémon from the anime
  - Thursday: A trainer version of MissingNo., with three different variants for morning, day, and night
  - Friday: Giovanni, using Ground types plus Persian
  - Saturday: Karen, using Dark types; only appears at night
  - Sunday: In the morning, Mr. Fuji appears, no battle; in the day, if you have access to Mt. Silver, Lance will appear for a rematch with levels similar to the Lance/Clair double battle in HGSS; if you talk to Mr. Fuji the same morning before you battle Lance, Lance will give you another Master Ball upon defeat
- A lounge on Route 23, only accessible if you've opened Mt. Silver, where Gym Leaders and Red can be found and rematched; Clair isn't rematched since her team would be too similar to Lance in his rematch above, but available rematches on a given day can be repeated infinitely for easy late-game grinding
  - Monday: Falkner and Brock
  - Tuesday: Bugsy and Misty
  - Wednesday: Whitney and Lt. Surge
  - Thursday: Morty and Erika
  - Friday: Chuck and Janine
  - Saturday: Jasmine and Sabrina
  - Sunday: Pryce and Blaine, and Blue can be rematched if you've spoken to Mr. Fuji in the Route 22 house on that day
  - If you've beaten Red in Mt. Silver, he can be rematched here any day, now without the credits, and additionally the Gym Guide will give out infinite free Rare Candies

## Miscellaneous
- Sleep now lasts from 1 to 5 turns both in and outside the Battle Tower
- All bedroom decorations obtained throughout the game (but Mystery Gift is disabled)
- Due to no Mystery Gift, the Trainer House now has you fight a copy of your own party from the last time you saved (this feature is now available [as a tutorial](https://github.com/pret/pokecrystal/wiki/Fight-a-copy-of-your-own-party-in-the-Trainer-House))
- When you set loose the Legendary Beasts beneath the Burned Tower, they automatically count as seen in the Pokédex, allowing you to track their roaming without having to stumble upon them first
- The Odd Egg will always hatch into a shiny, and now may hatch into starters
- The Dratini gifted from the Dragon Shrine always knows Extremespeed, not only if you answer all the questions right
- NPCs in Kanto who sell Berries and Apricorns
- Tweaks to specific move effects like the possible powers of Present and Magnitude
- Tweaks to enemy trainer AI
- Pokéfans and a few other trainers use nicknames for their Pokémon
- Chansey NPCs in Pokémon Centers, Delibird NPCs in Poké Marts, and nurses and clerks are color-coded based on the city's name
- Color-coded starter balls
- Color-coded item balls in the field (blue for TMs, green for HMs and their replacement items, gray for Sacred Ash, brown for the Coin Case)
- Most trainer money rewards increased, but Rockets now give no money due to being criminals (and Teachers give minimal due to not getting paid enough)
- Happiness builds a bit faster
- Eggs hatch roughly twice as fast, and come out at Lv.1 instead of Lv.5
- Higher chance to contract Pokérus, and no requirement to reach Goldenrod first (no Goldenrod requirement for Shuckle to make Berry Juice either)
- Nidorina and Nidoqueen can breed, and any of the Nidos can produce either gender of Nidoran eggs; Tauros and Miltank can produce each other's eggs, and Metapod, Kakuna, and Porygon can no longer breed (Porygon2 still can)
- Nidorino can now evolve into Nidoqueen instead of Nidoking by using a Sun Stone instead of a Moon Stone, and Nidorina into Nidoking (Moon Stones still work normally for both)
- Weepinbell can now evolve into Bellossom with a Sun Stone (Gloom still can as well)
- Marill now evolves with a Water Stone, increasing parallels to Pikachu
- Automatic weather in certain areas: sunlight in the National Park, the top of the Tin Tower, and Blaine's Gym; rain inside Slowpoke Well, the Whirl Islands, and Misty's Gym; Hail in the Ice Path, Lugia's chamber, and Pryce's Gym; and Sandstorms in Victory Road, Mt. Silver, and Brock's Gym
- Unfought Gym trainers can still be fought after the Leader is defeated
- Phone contacts who required specific Pokémon in the player's party to be registered no longer have those requirements, but give out lesser sellable items instead of Nuggets
- All Kanto Gym Leaders give out TMs when defeated (some of these could already be bought or found earlier, but hey, it's something)
- No more swarm encounters
- No more badge boosts (stat-based or type-based)
- Changes to some overworld sprites and palettes, either for accuracy or to make important NPCs stand out more
- Lt. Surge's trashcan puzzle restored and modified, Blaine's cave Gym expanded, smashable rocks added to Brock's Gym, and a quick exit warp added to Sabrina's Gym
- The Marshbadge and Soulbadge have their names and designs swapped
- Female players retain their female sprites in the Link Trade and Battle rooms
- Text edits, often humorous (or so I'd like to think)

# Minor Edits

See: https://github.com/pret/pokecrystal/wiki/Tutorials

- Unused experience growth rates given to some Pokémon, and a few other rates changed
- Clock reset procedure simplified
- A Pokémon being shiny now indicates perfect or near-perfect DVs
- Tiles animate even when textboxes are open
- Enemy trainers have maximum happiness for a powerful Return
- Colored party menu icons, plus a few new ones
- Some songs imported from Gen I
- A fourth Pokémon stats page showing DVs and Hidden Power type
- One more wild Pokémon slot for both grass and water
- Surf encounter level variance of +0 to +4 applied to all wild encounters, including fishing (excluding Headbutt and Rock Smash; couldn't get those to work)
- Time fishgroups actually have different Pokémon at different times
- Unown ! and ? added (eyes not droopy)
- Rocket battle music applied to Executives, "R" transition for all Rockets, and a special transition for me
- Trainers automatically offer their phone numbers when defeated, and their rematch parties are based solely on event progress instead of fight count
- Flypoints for the Pokémon Centers at Union Cave and Rock Tunnel, plus the heal house on Route 26; a Pokémon Center added to Route 3 with a flypoint
- Instant text speed option
- Default player and rival names changed
- Outdoor sprite system improvement
- Event initialization system improvement
- Increased max number of tiles for Pokémon animations
- Trainer types refactored into bit flags
- Trainer card visual upgrades: leader head tops, badge colors, Kanto badge page
- Correct grammar for plural trainers like Twins
- Short beeping noise for low HP
- Artificial save delays removed
- Press Select to view shiny colors in the Pokédex
- Lucky Number daily instead of weekly
- Pokémon gender formula modified for stat equity
- Kurt finishes Apricorn balls quickly
- Accuracy, effect chance, and physicality shown on move menu
- 25% AI failure chance removed
- Redundant move grammar table removed
- Command queue system reduced to just stone tables
- No experience gained at Lv100
- Poison damage in the field every 5 steps instead of 4
- TM and HM move names shown upon acquisition and in marts
- Automatic prompts to use another Repel
- Certain moves learned upon evolution regardless of level
- Icons shown for active weather when selecting moves in battle
- Unique colors for each thrown Poké Ball
- Smashing rocks has a chance to give items (Headbutting trees too!)
- Customizable Pokédex color
- Night arrangement for the Kanto wild battle theme, to go along with the existing Johto one
- Menu account replaced with clock

# Bug Fixes

- See: https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/docs/design_flaws.md
- And: https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/docs/bugs_and_glitches.md

I haven't done absolutely everything in both of those, but most. The main takeaway is that the Apricorn balls should all now work the way they were intended to. The Moon Ball has been recoded, and now has a higher catch chance even on pre-evolutions of Moon Stone evolvers.

# Why remove some Pokémon and moves?

In both cases, the maximum number is limited by the size of a byte. (That's 256, but actually a few less because some values are used for other purposes, such as indicating a lack of an entry or the end of the list.) There are possible ways around this, but they're a bit above my skill level, and even if I bypass the numerical limit, I may not have room for more entries in the memory banks, which are much harder to work around. As for deciding to remove the baby Pokémon, I really didn't want to remove any Pokémon even if they were useless in battle (I think Pichu is cuter than Pikachu!), but I was also really excited about adding new Pokémon, and the way I see it, the main purpose of the baby Pokémon is to encourage the breeding mechanic by requiring it for Pokédex completion, but this particular hack is supposed to be pretty silly and breezy, so I doubt anyone will spend time breeding in it, or even completing the Pokédex for that matter. I kept Togepi because of the free egg and Tyrogue to properly connect the Hitmons, and the rest is recent history.

# Why did you use THIS beta mon instead of THAT one?

Along with personal preference, I prioritized the ones that could most reasonably be given unique type combinations (unique within this hack, that is), thus allowing for wider type variety overall.

# Why aren't you using newbox?

Again, above my skill level. It also has some requirements like variable-width font and certain pixel restrictions on Pokémon icons, and I don't really want to deal with all that.

# Why aren't you letting Nayru's dex show fishing encounters?

Because I added the Odd Rod, the code would have to be adjusted, and I don't know how. My design theory excuse is that some people get a thrill out of not knowing what Pokémon is going to pop up, so fishing caters to them. Of course, you can always just check the encounters in https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/data/wild/fish.asm

# Can I copy your code?

Yes, but to call this repository "disorganized" would be flattery. Don't say I didn't warn you.

# Credits

Coding help - The entire github/pret/pokecrystal community, Discord, and tutorials, but especially Nayru62, ax6/aaaaaa123456789, Rangi42/Sylvie, Idain, and DamienDoury. More names in https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/data/credits_strings.asm

ArtUnderTheArch - Percy trainer sprite, Percy overworld sprites, surfing Pikachu backsprite, flying Pikachu backsprite

Lucas Wright - Yanmega and Whimsicott frontsprites

SCMidna - Unown ! and ? sprites and animations

Tom Wang - male player running frames

Seasick/Mauve Sea - female player running frames, Mary sprites

Bronzeswagger - Hail weather icon (before I edited it)

Mmmmmmmmmmmmmmmmm - Route 47 theme demix

Cottonee fronsprite and Cottonee, Whimsicott, and Yanmega backsprites - edited from a sheet that credits LostImpact, Neslug, Gold Z, Chaos Rush, Solo, lakeofdance, Blue Emerald, bloodless, Pokekoks, boonzeet, and Rangi

Some Pokémon icons taken from sheets by Emi Monserrate, LuigiTKO, Chamber, Solo0993, Blue Emerald, Lake, Neslug, and Pikachu25
