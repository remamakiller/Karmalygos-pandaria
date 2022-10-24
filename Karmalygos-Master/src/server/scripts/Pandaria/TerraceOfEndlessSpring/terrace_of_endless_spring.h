#ifndef TERRACE_OF_ENDLESS_SPRING_H_
#define TERRACE_OF_ENDLESS_SPRING_H_

#include "SpellScript.h"
#include "Map.h"
#include "Creature.h"
#include "CreatureAIImpl.h"

#define MAX_MINIONS_WP 2
#define DARK_OF_NIGHT_RANGE 37.62f

const Position MinionOfFearWaypoints[MAX_MINIONS_WP]
{
    {-1017.84f, -2951.74f, 19.32f, 4.79f},
    { -1017.34f, -2962.39f, 12.59f, 4.73f }
};

const Position TsulongLeavePos = { -1086.18f, -2880.90f, 115.34f, 2.12f };
const Position DreadCenter     = { -1738.82f, -3817.69f, -279.50f, 6.25f };

enum eData
{
    DATA_PROTECTORS,
    DATA_TSULONG,
    DATA_LEI_SHI,
    DATA_SHA_OF_FEAR,
    DATA_MAX_BOSS_DATA
};

enum eTypes
{
    TYPE_PROTECTORS,
    TYPE_TSULONG,
    TYPE_LEI_SHI,
    TYPE_SHA,
    TYPE_LEIS_HOPE,
    TYPE_LEI_INTRO,
    INTRO_DONE,
    MAX_TYPES,
};

enum eLFRLootBind
{
    LFR_LOOT_BIND_SHA_OF_FEAR       = 6
};

enum eSpells
{
    SPELL_RITUAL_OF_PURIFICATION    = 126848,
    SPELL_LEIS_HOPE                 = 129368,
    SPELL_BERSERK                   = 144369,
};

enum eActions
{
    ACTION_START_TSULONG_WAYPOINT   = 1,
    ACTION_INTRO_FINISHED           = 2,
    ACTION_LEISHI_INTRO             = 4,
    ACTION_SHA_INTRO                = 8,
    TYPE_DREAD_TERRACE,
};

enum eCreatures
{
    // Protectors of the Endless
    NPC_ANCIENT_ASANI               = 60586,
    NPC_ANCIENT_REGAIL              = 60585,
    NPC_PROTECTOR_KAOLAN            = 60583,
    NPC_DEFILED_GROUND              = 60906,
    NPC_COALESCED_CORRUPTION        = 60886,
    NPC_MINION_OF_FEAR_CONTROLLER   = 60957,
    NPC_MINION_OF_FEAR              = 60885,
    NPC_SLG_GENERIC_MOP             = 63420, // stalker with water vortex

    // Tsulong
    NPC_TSULONG                     = 62442,
    NPC_EMBODIED_TERROR             = 62969,
    NPC_LIGHT_OF_DAY                = 63337,
    NPC_UNSTABLE_SHA_TARGET         = 62962,
    NPC_DARK_OF_NIGHT               = 63346,
    NPC_FRIGHT_SPAWN                = 62977,
    NPC_ENCHANTED_PLANT             = 64443,

    // Lei Shi
    NPC_LEI_SHI                     = 62983,
    NPC_ANIMATED_PROTECTOR          = 62995,
    NPC_LEI_SHI_HIDDEN              = 63099,
    NPC_REFLECTION_OF_LEI_SHI       = 71095,

    // Sha of Fear
    NPC_SHA_OF_FEAR                 = 60999,
    NPC_PURE_LIGHT_TERRACE          = 60788,
    NPC_TERROR_SPAWN                = 61034,
    NPC_RETURN_TO_TERRACE           = 65736,
    NPC_WATERSPOUT                  = 63823,
    NPC_DREAD_SPAWN                 = 61003,
    NPC_GENERAL_BUNNY_JMF           = 45979,

    // Thrashs
    NPC_APPARITION_OF_FEAR          = 64368,
    NPC_APPARITION_OF_TERROR        = 66100,
    NPC_NIGHT_TERRORS               = 64390,
    NPC_NIGHT_TERROR_SUMMON         = 64393,
    NPC_CORRUPTED_PROTECTOR         = 63275,
};

enum eGameObjects
{
    GO_WALL_OF_COUNCILS_VORTEX      = 214854,
    GO_COUNCILS_VORTEX              = 214853,

    GO_WALL_OF_LEI_SHI              = 214852,
    GO_LEI_SHIS_VORTEX              = 214851,

    GO_TSULONG_CHEST_LFR            = 215355,
    GO_TSULONG_CHEST_NORMAL         = 215356,
    GO_TSULONG_CHEST_HEROIC         = 215357,

    GO_LEI_SHI_CHEST_NORMAL         = 213076,
    GO_LEI_SHI_CHEST_HEROIC         = 213075,

    GO_SHA_VORTEX                   = 214850,
    GO_SHA_VORTEX_WALL              = 214849
};

enum eTimers
{
    TIMER_TSULONG_SPAWN    = 10000,
};

enum Worldstates
{
    WORLDSTATE_MIND_KILLER = 12244,
};

#endif // TERRACE_OF_ENDLESS_SPRING_H_
