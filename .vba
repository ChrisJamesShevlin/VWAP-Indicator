//PRC_VWAP intraday
//SAME VERSION AS THE ORIGINAL VWAP FROM THE PLATFORM
//09.01.2020
//Nicolas @ www.prorealcode.com
//Sharing ProRealTime knowledge

if day<>day[1] then
d=0
else
d=d+1
if volume >0 then
VWAP = SUMMATION[d](volume*typicalprice)/SUMMATION[d](volume)
endif
sd = std[d](abs(typicalprice-vwap))

SDup1 = vwap+sd
SDlw1 = vwap-sd
SDup2 = vwap+sd*2
SDlw2 = vwap-sd*2
SDup3 = vwap+sd*3
SDlw3 = vwap-sd*3
endif

if vwap>vwap[1] then
color = 1
else
color = -1
endif


RETURN VWAP coloured by color STYLE(LINE,2) as "VWAP", SDup1 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 1 STD", SDlw1 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 1 STD", SDup2 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 2 STD", SDlw2 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 2 STD", SDup3 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 3 STD", SDlw3 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 3 STD"
