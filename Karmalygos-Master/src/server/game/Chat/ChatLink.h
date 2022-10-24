/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TRINITYCORE_CHATLINK_H
#define TRINITYCORE_CHATLINK_H

#include "SharedDefines.h"
#include <sstream>
#include <list>

struct ItemLocale;
struct ItemTemplate;
struct ItemRandomSuffixEntry;
struct ItemRandomPropertiesEntry;
class SpellInfo;
struct AchievementEntry;
struct GlyphPropertiesEntry;
class Quest;

///////////////////////////////////////////////////////////////////////////////////////////////////
// ChatLink - abstract base class for various links
class ChatLink
{
public:
    ChatLink() : _color(0), _startPos(0), _endPos(0) { }
    virtual ~ChatLink() { }
    void SetColor(uint32 color) { _color = color; }
    // This will allow to extract the whole link string from the message, if necessary.
    void SetBounds(std::istringstream::pos_type startPos, std::istringstream::pos_type endPos) { _startPos = startPos; _endPos = endPos; }

    virtual bool Initialize(std::istringstream& iss) = 0;
    virtual bool ValidateName(char* buffer, const char* context) = 0;

protected:
    uint32 _color;
    std::string _name;
    std::istringstream::pos_type _startPos;
    std::istringstream::pos_type _endPos;
};

// ItemChatLink - link to item
class ItemChatLink : public ChatLink
{
public:
    ItemChatLink() : ChatLink(), _item(NULL), _suffix(NULL), _property(NULL) { }
    virtual bool Initialize(std::istringstream& iss);
    virtual bool ValidateName(char* buffer, const char* context);

protected:
    std::string FormatName(uint8 index, ItemLocale const* locale, DbcStr const* suffixStrings) const;

    ItemTemplate const* _item;
    int32 _data[10];
    ItemRandomSuffixEntry const* _suffix;
    ItemRandomPropertiesEntry const* _property;
};

// QuestChatLink - link to quest
class QuestChatLink : public ChatLink
{
public:
    QuestChatLink() : ChatLink(), _quest(NULL), _questLevel(0) { }
    virtual bool Initialize(std::istringstream& iss);
    virtual bool ValidateName(char* buffer, const char* context);

protected:
    Quest const* _quest;
    int32 _questLevel;
};

// SpellChatLink - link to quest
class SpellChatLink : public ChatLink
{
public:
    SpellChatLink() : ChatLink(), _spell(NULL) { }
    virtual bool Initialize(std::istringstream& iss);
    virtual bool ValidateName(char* buffer, const char* context);

protected:
    SpellInfo const* _spell;
};

// AchievementChatLink - link to quest
class AchievementChatLink : public ChatLink
{
public:
    AchievementChatLink() : ChatLink(), _guid(0), _achievement(NULL) { }
    virtual bool Initialize(std::istringstream& iss);
    virtual bool ValidateName(char* buffer, const char* context);

protected:
    uint32 _guid;
    AchievementEntry const* _achievement;
    uint32 _data[8];
};

// TradeChatLink - link to trade info
class TradeChatLink : public SpellChatLink
{
public:
    virtual bool Initialize(std::istringstream& iss);
};

// TalentChatLink - link to talent
class TalentChatLink : public SpellChatLink
{
public:
    virtual bool Initialize(std::istringstream& iss);
};

// EnchantmentChatLink - link to enchantment
class EnchantmentChatLink : public SpellChatLink
{
public:
    EnchantmentChatLink() : SpellChatLink() { }
    virtual bool Initialize(std::istringstream& iss);
};

// GlyphChatLink - link to glyph
class GlyphChatLink : public SpellChatLink
{
public:
    virtual bool Initialize(std::istringstream& iss);
};

class CurrencyLink : public ChatLink
{
public:
    bool Initialize(std::istringstream& iss) override;
    bool ValidateName(char* buffer, char const* context) override;

private:
    CurrencyTypesEntry const* _currency;
};

class BattlePetLink : public ChatLink
{
public:
    bool Initialize(std::istringstream& iss) override;
    bool ValidateName(char* buffer, char const* context) override;
};

class BattlePetAbilityLink : public ChatLink
{
public:
    bool Initialize(std::istringstream& iss) override;
    bool ValidateName(char* buffer, char const* context) override;
};

class JournalLink : public ChatLink
{
public:
    bool Initialize(std::istringstream& iss) override;
    bool ValidateName(char* buffer, char const* context) override;
};

class LinkExtractor
{
public:
    explicit LinkExtractor(const char* msg);
    ~LinkExtractor();

    bool IsValidMessage();

private:
    typedef std::list<ChatLink*> Links;
    Links _links;
    std::istringstream _iss;
};


#endif // TRINITYCORE_CHATLINK_H
