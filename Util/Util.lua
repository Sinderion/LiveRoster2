function LR_TotalDays(DateObj)
		DateObj.Year = DateObj.Year or 0;
		DateObj.Month = DateObj.Month or 0;
		DateObj.Day = DateObj.Day or 0;
		local Date = DateObj.Year * 365 + DateObj.Month * 30.5 + DateObj.Day;
	return Date;
end
