--[[
LR_LiveCharacter_Class

Requires: 
../Util/Util.lua
../Const/Const.lua
../OOP/OOP.lua

API:
MyCharacter: = LR_Character_Class:New();
MyCharacter:SetFromGuildRoster(5);
MyCharacter:SetIndex(1);
Index = MyCharacter:GetIndex();
RankString = MyCharacter:GetRank();
RankIndex = MyCharacter:GetRankIndex();
Note = MyCharacter:GetNote();
OfficerNote = MyCharacter:GetOfficerNote();
ClassString = MyCharacter:GetClass();
ClassFileName = MyCharacter:GetClassFilename();
Level = MyCharacter:GetLevel();
CharacterAndServerName = MyCharacter:GetLongName();
Shortname = MyCharacter:GetShortName();
DateObject = MyCharacter:GetLastOnline;



]]

LR_Character_Class = {};
LR_Character_Class_NilKey = {};
function LR_Character_Class:New()
   local Character ={
	  __Index = -1,
      __LongName = LR_EMPTY_STRING,
      __Rank = LR_EMPTY_STRING,
      __RankIndex = -1,
      __Level = -1,
      __Class = LR_EMPTY_STRING,
      __ClassFileName = LR_EMPTY_STRING,
      __Note = LR_EMPTY_STRING,
      __OfficerNote = LR_EMPTY_STRING,
      __ShortName = LR_EMPTY_STRING,
	  __LastOnline = {Years = -1, Months = -1, Days = -1}
   };
   LR_OOP.InheritClass(Character,LR_Character_Class);
   return Character;
end
function LR_Character_Class:SetFromGuildRoster(index)
   local name, rank, rankIndex, level, class, zone, note, 
   officernote, online, status, classFileName, 
   achievementPoints, achievementRank, isMobile, isSoREligible, standingID = GetGuildRosterInfo(index);
   local shortname, _ = string.split("-", name);
   self.__LongName = name;
   self.__ShortName = shortname;
   self.__Rank = rank;
   self.__RankIndex = rankIndex;
   self.__Level = level;
   self.__Class = class;
   self.__Note = note;
   self.__OfficerNote = officernote;
   self.__Online = online;
   self.__ClassFileName = classFileName;
   local years, months, days, _ = GetGuildRosterLastOnline(index);
   self.__LastOnline = {Years = years, Months = months, Days = days};
end
function LR_Character_Class:SetIndex(Index)
	self.__Index = Index;
end
function LR_Character_Class:GetIndex()
	return self.__Index
end
function LR_Character_Class:GetRank()
   return self.__Rank;
end
function LR_Character_Class:GetRankIndex()
	return self.__RankIndex;
end
function LR_Character_Class:GetNote()
   local Note = self.__Note or LR_EMPTY_STRING;
   return Note;
end
function LR_Character_Class:GetOfficerNote()
   local Note = self.__OfficerNote or LR_EMPTY_STRING;
   return Note;
end
function LR_Character_Class:GetClass()
   return self.__Class;
end
function LR_Character_Class:GetClassFilename()
	return self.__ClassFileName;
end
function LR_Character_Class:GetLevel()
   return self.__Level;
end
function LR_Character_Class:GetLongName()
	return self.__LongName;
end
function LR_Character_Class:GetShortName()
	return self.__ShortName;
end
function LR_Character_Class:GetLastOnline()
	return self.__LastOnline;
end