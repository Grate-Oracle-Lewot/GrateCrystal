# Pokémon Grate Crystal

URL: https://github.com/Grate-Oracle-Lewot/GrateCrystal

This is an edit of GitHub's "pokecrystal" disassembly—in other words, a Pokémon Crystal romhack. It's called "Grate" Crystal because the editing (but not the original disassembling) was done by me, the Grate Oracle Lewot. There's not much of a theme to this project—it's just kind of me figuring out how the whole hacking process works and seeing what all I can get away with. I'll list most of the changes below, but I'm bound to miss more than a few details, so consider the list non-exhaustive.

# Major Edits

- Fairy type added
- Physical/Special split
- TMs are infinite-use
- Text scrolls automatically in battle (and at a few other key points)
- Run at bike speed by holding B (no effect on wild encounter rate)
- Greatly increased pack and PC storage space, including a separate "Fruit" pocket for Berries and Apricorns
- Berry and Apricorn trees now give out 5 at a time, as do phone contacts who give Berries
- Access to the GS Ball Celebi event, and new rooms with static encounters for Articuno, Zapdos, Moltres, Mew, and Mewtwo
- Slight increase to all experience gains, and experience is now gained from catching Pokémon
- A completely different Elite Four based on me and my friends/family (Lance is still the Champion)
- X items (X Attack, X Defend, etc.) now activate automatically if held in battle
- Overhaul of Pokémon learnsets, egg moves, breeding groups, encounter locations, encounter levels, enemy trainer parties, wild held items, some base stats, etc.
  - Unown and Delibird learn multiple moves
  - All non-legendary Pokémon can be obtained prior to the Pokémon League
  - Enemy trainer parties are more diverse and generally stronger
  - Any Pokémon that received a new evolution in a later generation has its base stats increased to about halfway between its original stats and those of its evolution, to compensate for the evolutions not being present
  - Pokémon that would/should have Levitate as an Ability can now learn Fly, to compensate for the lack of Abilities
  - Small first-form bird Pokémon can no longer learn Fly, needing to evolve first
  - All Pokémon that only belonged to one Egg Group now belong to two, and legendaries can now breed with Ditto
  - Some new trainer battles
- After defeating Blue, you can battle Prof. Oak at Mr. Pokémon's house once per day, and if you win, Mr. Pokémon will give you another Odd Egg
- New Pokédex entries for every Pokémon (still in progress)
- A few Pokémon have been reverted to their beta designs from the Spaceworld demos, and Butterfree and Venomoth have had their sprites swapped
- All of the rival's dialogue has been replaced with that from the Vietnamese Crystal bootleg

## Type chart changes
- Fairy merely resists Dragon instead of being totally immune
- Ice now resists Flying
- Steel no longer resists Ghost or Psychic

## Pokémon added
- Yanmega
- Whimsicott

## Pokémon type changes
- Rattata/Raticate: Normal -> Normal/Dark
- Spearow/Fearow: Normal/Flying -> Flying
- Pichu/Pikachu: Electric -> Electric/Fairy
- Vulpix/Ninetales: Fire -> Fire/Ice
- Meowth/Persian: Normal -> Normal/Steel
- Golduck: Water -> Water/Psychic
- Mankey/Primape: Fighting -> Fighting/Dark
- Ponyta/Rapidash: Fire -> Fire/Fairy
- Farfetch'd: Normal/Flying -> Fighting/Flying
- Seel: Water -> Water/Ice
- Grimer/Muk: Poison -> Poison/Dark
- Shellder/Cloyster: Water(/Ice) -> Water/Steel
- Drowzee/Hypno: Psychic -> Psychic/Dark
- Krabby/Kingler: Water -> Water/Bug
- Marowak: Ground -> Ground/Ghost
- Koffing/Weezing: Poison -> Poison/Fairy
- Rhyhorn/Rhydon: Ground/Rock -> Steel/Rock
- Tangela: Grass -> Grass/Water
- Kangaskhan: Normal -> Normal/Fighting
- Gyarados: Water/Flying -> Water/Dragon
- Mewtwo: Psychic -> Psychic/Fighting
- Noctowl: Normal/Flying -> Ghost/Flying
- Ampharos: Electric -> Electric/Dragon
- Politoed: Water -> Water/Ghost
- Sunflora: Grass -> Grass/Fire
- Slowking: Water/Psychic -> Poison/Psychic
- Girafarig: Normal/Psychic -> Normal/Ghost
- Dunsparce: Normal -> Dark/Fairy
- Qwilfish: Water/Poison -> Water/Fire
- Stantler: Normal -> Normal/Psychic
- Hitmontop: Fighting -> Fighting/Fairy
- Smoochum: Ice/Psychic -> Ice/Fairy
- Larvitar/Pupitar: Rock/Ground -> Rock/Dark
- Lugia: Psychic/Flying -> Ice/Dragon (Aeroblast is Ice-type too and called "Zeroblast")
- Ho-Oh: Fire/Flying -> Fire/Dragon
- Yanmega: Bug/Flying -> Bug/Dragon
- Unown's type now appears as "???", and it's neutral to all types

## Moves
Check all changes under https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/data/moves/moves.asm

- Removed: Splash, Razor Wind, Barrage, Pain Split, Constrict, Detect, Sharpen, Mimic, and Explosion (Selfdestruct is now as strong as Explosion)

- Added: Fairy Wind, Play Rough, Moonblast, Draining Kiss (renamed Drain Kiss), Dazzling Gleam (renamed Dazzly Gleam), Dark Pulse, Silver Wind, Signal Beam, Earth Power, Iron Head, Aura Sphere, Hail, and a new move called Night Terror (a high-power physical Ghost-type move that, like Snore, can only be used while asleep)

- Most moves with a power below 40 have been bumped up to 40 (or 20 for multiple-hit moves). A few other changes to move powers, and almost every move has received an accuracy boost.

- Many moves have had their types changed to allow for better move variety within rarer types.

- HM moves are better in battle, and a few moves have had their effects changed completely. Hyper Fang drains HP, Low Kick lowers Evasion, Rolling Kick is a guaranteed flinch, Leer lowers Special Defense, Kinesis sharply raises Special Attack, etc.

- Tri Attack is now ???-type like Unown, and its effectiveness is based on Fire, Ice, and Electric combined.

- Foresight, along with letting Normal and Fighting moves hit Ghost types, now lets Ghost moves hit Normal types and Psychic moves hit Dark types.

## Items
- "Pocket PC" obtained from Bill in Ecruteak, letting you access the PC anywhere (but you get a "no signal" message inside caves)
- New key items obtained throughout the game that can perform the out-of-battle functions of HM moves without the need for the move (but you still need the corresponding badge)
- New fishing rod, the Odd Rod, hooks rare Pokémon like Omanyte and Kabuto
- "Link Voucher" for evolving Pokémon that evolve by trade
- New held items that each completely prevent a specific status condition
- X Sp. Defend, Dusk Ball, and Eviolite
- A few more TMs
- Itemfinder removed

## Move tutors

- The one in Goldenrod who teaches Flamethrower, Thunderbolt, and Ice Beam will now teach moves as soon as you defeat Whitney, appears every day instead of just certain days of the week, can teach multiple moves in one day, and can now also teach Tri Attack

- Two new ones in Kanto: one will teach Sacred Fire in exchange for a Gold Leaf, and one Zeroblast (Aeroblast) for a Silver Leaf

- One in the Ruins of Alph research center will teach Aura Sphere for free once you collect all forms of Unown

## Game Corner prize Pokémon

- Johto: Abra Lv10 (500C), Porygon Lv10 (1000C), Wobbuffet Lv20 (1500C)

- Kanto: Aerodactyl Lv10 (3000C), Porygon2 Lv30 (4000C), Togetic Lv30 (5000C)

## Locations
- Viridian Forest
- Pewter Museum (no fossil resurrection, since fossil Pokémon can be found in the wild)
- An abandoned version of the Safari Zone
- A room linking Union Cave and Slowpoke Well together
- An extra room in Dark Cave
- A backroom to the Goldenrod Game Corner where you can battle Gamblers whose Pokémon are high-level but use luck-based moves like one-hit-KOs or Metronome
- A version of Seafoam Cave hosting a final, all-Lv100 battle against me (unlocked by beating Red)
- A house on Route 22 where different characters appear, most of whom can be battled once per day
  - Monday: Koga, who now uses Fairy types instead of Poison
  - Tuesday: Officer Jenny; no battle, but she gives out 6 Rare Candies
  - Wednesday: Jessie and James, with their Pokémon from the anime
  - Thursday: A trainer version of MissingNo., with three different variants for day, morning, and night
  - Friday: Giovanni, using Ground types plus Persian
  - Saturday: Karen, using Dark types; only appears at night
  - Sunday: In the morning, Mr. Fuji appears, no battle; in the day, if you have access to Mt. Silver, Lance will appear for a rematch with levels similar to the Lance/Clair double battle in HGSS; if you talk to Mr. Fuji the same morning before you battle Lance, Lance will give you another Master Ball upon defeat

## Miscellaneous
- The Odd Egg can now hatch into starters (including Eevee) as well as babies, and whatever it becomes is a guaranteed shiny
- NPCs in Kanto who sell Berries and Apricorns
- Tweaks to specific move effects like the possible powers of Present and Magnitude
- Changes to the lists of moves referenced by different enemy trainer AI functions, potentially making them smarter
- Chansey NPCs in Pokémon Centers, and nurses are color-coded based on the city's name
- Color-coded starter balls
- Color-coded item balls in the field (blue for TMs, green for HMs and their replacement items, gray for Sacred Ash)
- Trainers give more money upon defeat
- Happiness builds faster
- Eggs hatch twice as fast
- Nidorina and Nidoqueen can breed
- Nidorino can now evolve into Nidoqueen instead of Nidoking by using a Sun Stone instead of a Moon Stone, and Nidorina into Nidoking (Moon Stones still work normally for both)
- Weepinbell can now evolve into Bellossom with a Sun Stone (Gloom still can as well)
- A few trade evolutions use a different method instead of the Link Voucher: the Metal Coat, Dragon Scale, and Up-Grade can now just be used like evolution stones, and Slowpoke uses Tyrogue's stat-based evolution method to choose between Slowbro and Slowking; Politoed is a nighttime happiness evolution, and Magby, Elekid, Smoochum, and Yanma now evolve by happiness as well, with Magby being daytime and Smoochum nighttime
- All final form starter base stat totals evened out to 534
- Hail boosts Ice-type moves as well as dealing damage, and Sandstorm gives a 50% Special Defense boost to Rock-type Pokémon like in later generations
- Automatic weather in certain areas: sunlight in the National Park, the top of the Tin Tower, and Blaine's Gym; rain inside Slowpoke Well, the Whirl Islands, and Misty's Gym; Hail in the Ice Path, Lugia's chamber, and Pryce's Gym; and Sandstorms in Victory Road, Mt. Silver, and Brock's Gym
- Unfought Gym trainers can still be fought after the Leader is defeated
- Phone contacts who required specific Pokémon in the player's party to be registered no longer have those requirements
- No more swarm encounters
- No more badge boosts (stat-based or type-based)
- Flame Wheel and Sacred Fire no longer thaw a Frozen user (had to get rid of it for space)
- Changes to some overworld sprites and palettes, either for accuracy or to make important NPCs stand out more
- Text edits, often humorous (or so I'd like to think)
- In the unedited Crystal, Unown could only be found in the Ruins of Alph, and only after completing at least one of the sliding block puzzles. In the normally-impossible scenario of encountering Unown before any letters are unlocked, the game would get stuck in an infinite loop trying to find an unlocked letter. Because Unown can be encountered in some other locations in Grate Crystal, there is now a 5% chance for the game to let through a locked Unown letter, preventing such infinite loops. As a consequence, all Unown letters are technically available before completing all (or any!) of the block puzzles.

# Minor Edits

See: https://github.com/pret/pokecrystal/wiki/Tutorials

- A Pokémon being shiny now indicates perfect or near-perfect DVs
- Tiles animate even when textboxes are open
- Enemy trainers have maximum happiness for a powerful Return
- Colored party menu icons, plus a few new ones
- A few songs imported from Gen I
- A fourth Pokémon stats page showing caught data
- One more wild Pokémon slot for both grass and water
- Surf encounter level variance of +0 to +4 applied to all wild encounters, including fishing, Headbutt, and Rock Smash (exact probabilities of each +1 altered a bit)
- Time fishgroups actually have different Pokémon at different times
- Unown ! and ? added (eyes not droopy)
- Rocket battle music applied to Executives, "R" transition for all Rockets, and a special transition for me
- Flypoints for the Pokémon Centers at Union Cave and Rock Tunnel, plus the heal house on Route 26
- Instant text speed option
- Town Map item functionality fixed (item still not actually used)
- Default player and rival names changed
- Outdoor sprite system fix
- Event initialization system fix
- Pokémon animation tile expansion... thing
- Trainer types refactored into bit flags
- Trainer card visual upgrades: leader head tops, badge colors, Kanto badge page
- Correct grammar for plural trainers like Twins
- Short beeping noise for low HP
- Artificial save delays removed
- Lucky Number daily instead of weekly
- Pokémon gender formula modified to allow stat equity
- 25% AI failure chance removed for stat-reduction moves, left in place for Sleep, Poison, and Paralysis
- Redundant move grammar table removed
- Command queue system reduced to just stone tables
- No experience gained at Lv100
- Poison damage in the field every 5 steps instead of 4
- Automatic prompts to use another Repel
- Certain moves learned upon evolution regardless of level
- Icons shown for active weather when selecting moves in battle
- Unique colors for each thrown Poké Ball
- I had problems getting the night music to work, or rather, fitting the audionighttable into the home bank. Right now, I just added the night version of the Kanto wild battle theme, to correspond to the existing Johto one. I'd like to use all the night music, but we'll see.

# Bug Fixes

- See: https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/docs/design_flaws.md
- And: https://github.com/Grate-Oracle-Lewot/GrateCrystal/blob/master/docs/bugs_and_glitches.md

I haven't done absolutely everything in both of those, but most. The main takeaway is that the Apricorn balls should all now work the way they were intended to.

# Known Bugs & Issues

- Whimsicott's back sprite is scrambled (probably applies to Yanmega and the ! and ? Unowns as well)

- Pokémon icons don't color on the nicknaming screen, moves screen, or Fly map

# FAQ

Q) Why not more Pokémon?

A) Because I'm not good enough at hacking.

In the code, Pokémon are defined by unseen ID numbers, and because of the way these numbers are stored, they can't go any higher than 255. All available slots are used up by the time you add a measly two more Pokémon; obviously your computer has more filespace than the Game Boy Color, but the ROM doesn't know that, and getting it to understand that would start to become more like coding a new game instead of just modifying an existing one.

Q) Why Yanmega and Whimsicott, then?

A) Favoritism.

Q) But no Cottonee?

A) No room. Sorry.

Q) Why not more moves?

A) Same deal. You'll notice I had to remove a few moves to make room for some of the added ones.

Q) Why not remove some Pokémon to make room for adding more?

A) My focus is on making "bad" Pokémon better instead of removing them.

Q) How do I make my own hack?

A) The base game disassembly is at https://github.com/pret/pokecrystal

You'll have to make an account on the website, and then you can create your own "fork"—a.k.a., your own copy of the disassembly, which you can then edit however you please. As for how to actually make anything work, though, I'm not the best one to ask. I've linked to all the tutorials already, so start by reading those.
