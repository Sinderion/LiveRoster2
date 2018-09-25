--[[
LR_Roster_Class

Requires: 
../Util/Util.lua
../Const/Const.lua
../OOP/OOP.lua
LR_Character_Class.lua

API:
MyRoster = LR_Roster_Class:New()
MyRoster:UpdateRoster();
MyCharacterPointer = MyRoster:GetCharacterByName("Sinderion-ShadowCouncil");
MyCharacterPointer2 = MyRoster:GetCharacterByIndex(6);
UpdateTimeNumber = MyRoster:GetUpdateTime();
**MyRoster:SetOption("UpdateFrequencey",500)

]]

LR_Roster_Class = {};
function LR_Roster_Class:New()
   local Roster = {
      __Roster = {},
      __Characters = {},
      __ShortNames = {},
	  __UpdateTime = -1,
	  __Options = {}
   };
   LR_OOP.InheritClass(Roster,LR_Roster_Class);
   print("Inheriting roster class");
   return Roster;
end
function LR_Roster_Class:GetCharacterByName(LongName)
	return self.__Characters[LongName];
end
function LR_Roster_Class:GetCharacterByIndex(Index)
	return self.__Roster[Index];
end
function LR_Roster_Class:GetUpdateTime()
	return time(self.__UpdateTime);
end
function LR_Roster_Class:__SetUpdated()
	self.__UpdateTime = date("*t",time());
end
function LR_Roster_Class:__RegisterCharacter(Character, Index)
   table.insert(self.__Roster,Character);
   Index = Index or #self.__Roster;
   Character:SetIndex(index);
   self.__Characters[Character:GetLongName()] = Character;
   self.__ShortNames[Character:GetShortName()] = Character;
end
function LR_Roster_Class:CharacterLoaded(LongName)
   return not not self.__Character[LongName];
end
function LR_Roster_Class:__PrepUI()
   CommunitiesFrame:Show();
   CommunitiesFrame.RosterTab:Click();
   CommunitiesFrame.MemberList.ShowOfflineButton:SetChecked(true);
end
function LR_Roster_Class:__LoadRoster()
   local index;
   for index = 1,GetNumGuildMembers() do
      local Character = LR_Character_Class:New();
      Character:SetFromGuildRoster(index);
      self:__RegisterCharacter(Character);
   end
   self:__SetUpdated();
end
function LR_Roster_Class:UpdateRoster()
self:__PrepUI();
self:__LoadRoster();
end

