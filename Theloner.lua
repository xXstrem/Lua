--[[

•   This file is copyrighted @LuaProjects .   •
•                -LuaProjects Source-                 •
•        • https://t.me/LuaProjects •         •
•]]
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
json = require('libs/JSON')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
luatele = require 'luatele'
Information = dofile('./sudo.lua') ---- ملف تخرين الايدي ولتوكن
ooowwdev = Information.id
Token = Information.Token
Theloner = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Theloner)
Lualoner = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Theloner,token=Token}
--- سطر 19 lualoner يمديك تعدلها ل اي شي تبيه مثلا bot او اسمك حتى
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..Token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id 
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url) 
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoin(msg)
JoinChannel = true
local Channel = Redis:get(Theloner..'Theloner:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_id.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function File_Bot_Run(msg,data)  --- بدايه ( File_Bot_Run )
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
local msg_id = msg.id
if data.content and data.content.text and data.content.text.text then
text = data.content.text.text
end
if data.sender and data.sender_id.user_id then
if tonumber(data.sender_id.user_id) == tonumber(Theloner) then
return false
end
end
if msg.message then
msg = msg.message
if msg.content.text and msg.content.text.text then
text = msg.content.text.text
end
end
if data.sender_id and data.sender_id.user_id then
if data.sender_id.user_id == tonumber(Theloner) then
return false
end
if msg.date and msg.date < tonumber(os.time() - 15) then
print("->> Old Message End <<-") -- هذا برضو شارح نفسه
return false
end
if tonumber(msg.sender_id.user_id) == tonumber(Theloner) then
print('This is reply for Bot') -- شارح نفسه
return false
end
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..Token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id 
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url) 
end
---- تخص الرتب
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={ooowwdev,5271603990}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
end
return ControllerAll
end
if The_ControllerAll(msg.sender_id.user_id) == true then  
msg.The_Controller = 1
end
if msg.The_Controller == 1 then   
msg.ControllerBot = true 
end
--- تخص الرتب


if Redis:get(Theloner..":lolEmoje:ar"..msg.sender_id.user_id) then
Redis:del(Theloner..":lolEmoje:ar"..msg.sender_id.user_id)
if string.len(text) > 300 then
return Lualoner.sendText(msg_chat_id,msg_id,"• لا يمكنك زخرفه اكثر من 20 حرف \n• ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)      
elseif text:match("\n") then
return Lualoner.sendText(msg_chat_id,msg_id,"• لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
local LOL_Ar13 = text:gsub('ض', 'ضِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ص', 'صِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ث', 'ثِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ق', 'قِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ف', 'فِٰ͒ــ')
LOL_Ar13 = LOL_Ar13:gsub('غ', 'غِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ع', 'عِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('خ', 'خِٰ̐ــ')
LOL_Ar13 = LOL_Ar13:gsub('ح', 'حِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ج', 'جِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ش', 'شِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('س', 'سِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ي', 'يِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ب', 'بِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ل', 'لِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ا', 'آ')
LOL_Ar13 = LOL_Ar13:gsub('ت', 'تِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ن', 'نِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('م', 'مِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ك', 'ڪِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ط', 'طِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ظ', 'ظِٰــ')
LOL_Ar13 = LOL_Ar13:gsub('ء', 'ء')
LOL_Ar13 = LOL_Ar13:gsub('ؤ', 'ؤ')
LOL_Ar13 = LOL_Ar13:gsub('ر', 'ر')
LOL_Ar13 = LOL_Ar13:gsub('ى', 'ى')
LOL_Ar13 = LOL_Ar13:gsub('ز', 'ز')
LOL_Ar13 = LOL_Ar13:gsub('و', 'ﯛ̲୭')
LOL_Ar13 = LOL_Ar13:gsub("ه", "໋۠هہؚ")
local LOL_Ar12 = text:gsub('ا','آ')
LOL_Ar12 = LOL_Ar12:gsub("ب","بّہ")
LOL_Ar12 = LOL_Ar12:gsub("ت","تَہَٰ")
LOL_Ar12 = LOL_Ar12:gsub("ح","حہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ج","جْۧ")
LOL_Ar12 = LOL_Ar12:gsub("خ","خٰ̐ہ")
LOL_Ar12 = LOL_Ar12:gsub("د","د")
LOL_Ar12 = LOL_Ar12:gsub("ذ","ذِ")
LOL_Ar12 = LOL_Ar12:gsub("ر","ر")
LOL_Ar12 = LOL_Ar12:gsub("ز","زَ")
LOL_Ar12 = LOL_Ar12:gsub("س","سٰٰٓ")
LOL_Ar12 = LOL_Ar12:gsub("ش","شِٰہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ص","صۛہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ض","ضۜہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ظ","ظۗہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("غ","غہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ف","ف͒ہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ق","قྀ̲ہٰٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ك","ڪٰྀہٰٰٖ")
LOL_Ar12 = LOL_Ar12:gsub("ل","ل")
LOL_Ar12 = LOL_Ar12:gsub("ن","نَِٰہٰ")
LOL_Ar12 = LOL_Ar12:gsub("ه","ھہ")
LOL_Ar12 = LOL_Ar12:gsub("و","وِ")
LOL_Ar12 = LOL_Ar12:gsub("طۨہٰٰ","ط")
LOL_Ar12 = LOL_Ar12:gsub("ث","ثہٰٰ")
LOL_Ar12 = LOL_Ar12:gsub("ي","يِٰہ")
LOL_Ar12 = LOL_Ar12:gsub("ع","؏ۤـہٰٰ")
local LOL_Ar11 = text:gsub('ض', 'ضُ͠')
LOL_Ar11 = LOL_Ar11:gsub('ص', 'صّ͠')
LOL_Ar11 = LOL_Ar11:gsub('ث', 'ثُ͠')
LOL_Ar11 = LOL_Ar11:gsub('ق', 'ق͠')
LOL_Ar11 = LOL_Ar11:gsub('ف', 'ف͠')
LOL_Ar11 = LOL_Ar11:gsub('غ', 'غ͠')
LOL_Ar11 = LOL_Ar11:gsub('ع', 'ع͠')
LOL_Ar11 = LOL_Ar11:gsub('خ', 'ٌخ͠')
LOL_Ar11 = LOL_Ar11:gsub('ح', 'حُ͠')
LOL_Ar11 = LOL_Ar11:gsub('ج', 'جْ͠')
LOL_Ar11 = LOL_Ar11:gsub('ش', 'شِ͠')
LOL_Ar11 = LOL_Ar11:gsub('س', 'سِ͠')
LOL_Ar11 = LOL_Ar11:gsub('ي', 'ي͠')
LOL_Ar11 = LOL_Ar11:gsub('ب', 'بّ͠')
LOL_Ar11 = LOL_Ar11:gsub('ل', 'ل͠')
LOL_Ar11 = LOL_Ar11:gsub('ا', 'ا')
LOL_Ar11 = LOL_Ar11:gsub('ت', 'تْ͠')
LOL_Ar11 = LOL_Ar11:gsub('ن', 'ن͠')
LOL_Ar11 = LOL_Ar11:gsub('م', 'م͠')
LOL_Ar11 = LOL_Ar11:gsub('ك', 'گ͠')
LOL_Ar11 = LOL_Ar11:gsub('طِ', 'ط͠')
LOL_Ar11 = LOL_Ar11:gsub('ظ', 'ظٌ͠')
LOL_Ar11 = LOL_Ar11:gsub('ء', '͠ء')
LOL_Ar11 = LOL_Ar11:gsub('وَ', 'و͠')
LOL_Ar11 = LOL_Ar11:gsub('ر', 'ر͠')
LOL_Ar11 = LOL_Ar11:gsub('ى', '͠ى')
LOL_Ar11 = LOL_Ar11:gsub('ز', 'ز͠')
LOL_Ar11 = LOL_Ar11:gsub('ض','ض͠')
LOL_Ar11 = LOL_Ar11:gsub('و', 'وَ͠')
LOL_Ar11 = LOL_Ar11:gsub("ه", "ه͠")
local LOL_Ar10 = text:gsub('ض', 'ضِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ص', 'صِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ث', 'ثِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ق', 'قِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ف', 'فِ͒ـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('غ', 'غِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ع', 'عِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('خ', 'خِ̐ـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ح', 'حِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ج', 'جِـٰٚـِِـٰٚـِْ')
LOL_Ar10 = LOL_Ar10:gsub('ش', 'شِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('س', 'سِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ي', 'يِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ب', 'بِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ل', 'لِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ا', 'آ')
LOL_Ar10 = LOL_Ar10:gsub('ت', 'تِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ن', 'نِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('م', 'مِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ك', 'ڪِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ط', 'طِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ذ', 'ذِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ظ', 'ظِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('ء', 'ء')
LOL_Ar10 = LOL_Ar10:gsub('ؤ', 'ؤ')
LOL_Ar10 = LOL_Ar10:gsub('ر', 'ر')
LOL_Ar10 = LOL_Ar10:gsub('ى', 'ى')
LOL_Ar10 = LOL_Ar10:gsub('ز', 'ز')
LOL_Ar10 = LOL_Ar10:gsub('ظ', 'ظِـٰٚـ')
LOL_Ar10 = LOL_Ar10:gsub('و', 'ﯛ̲୭')
LOL_Ar10 = LOL_Ar10:gsub("ه", "ۿۿہ")
local LOL_Ar9  = text:gsub('ض', 'ض')
LOL_Ar9 = LOL_Ar9:gsub('ص', 'صہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ث', 'ثہٰـ')
LOL_Ar9 = LOL_Ar9:gsub('ق', 'قہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ف', 'فہٰ')
LOL_Ar9 = LOL_Ar9:gsub('غ', 'غـْ')
LOL_Ar9 = LOL_Ar9:gsub('ع', 'ع')
LOL_Ar9 = LOL_Ar9:gsub('ه', 'هٰہٰٖ')
LOL_Ar9 = LOL_Ar9:gsub('خ', 'خخَـ')
LOL_Ar9 = LOL_Ar9:gsub('ح', 'حہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ج', 'ججہٰ')
LOL_Ar9 = LOL_Ar9:gsub('د', 'دَ')
LOL_Ar9 = LOL_Ar9:gsub('ذ', 'ذّ')
LOL_Ar9 = LOL_Ar9:gsub('ش', 'ششہٰ')
LOL_Ar9 = LOL_Ar9:gsub('س', 'سہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ي', 'يٰ')
LOL_Ar9 = LOL_Ar9:gsub('ب', 'بٰٰ')
LOL_Ar9 = LOL_Ar9:gsub('ل', 'لہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ا', 'آ')
LOL_Ar9 = LOL_Ar9:gsub('ت', 'تہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ن', 'نہٰ')
LOL_Ar9 = LOL_Ar9:gsub('م', 'مہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ك', 'ككہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ط', 'طہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ئ', ' ْئٰ')
LOL_Ar9 = LOL_Ar9:gsub('ء', 'ء')
LOL_Ar9 = LOL_Ar9:gsub('ؤ', 'ؤؤَ')
LOL_Ar9 = LOL_Ar9:gsub('ر', 'رَ')
LOL_Ar9 = LOL_Ar9:gsub('لا', 'لہٰا')
LOL_Ar9 = LOL_Ar9:gsub('ى', 'ىہٰ')
LOL_Ar9 = LOL_Ar9:gsub('ة', 'ة')
LOL_Ar9 = LOL_Ar9:gsub('و', 'ہٰو')
LOL_Ar9 = LOL_Ar9:gsub('ز', 'ز')
LOL_Ar9 = LOL_Ar9:gsub('ظ', 'ظہٰ')
local LOL_Ar8  = text:gsub('ض', 'ضہ')
LOL_Ar8 = LOL_Ar8:gsub('ص', 'صہ')
LOL_Ar8 = LOL_Ar8:gsub('ث', 'ثہ')
LOL_Ar8 = LOL_Ar8:gsub('ق', 'قہ')
LOL_Ar8 = LOL_Ar8:gsub('ف', 'فہ')
LOL_Ar8 = LOL_Ar8:gsub('غ', 'غہ')
LOL_Ar8 = LOL_Ar8:gsub('ع', 'عہ')
LOL_Ar8 = LOL_Ar8:gsub('خ', 'خہ')
LOL_Ar8 = LOL_Ar8:gsub('ح', 'حہ')
LOL_Ar8 = LOL_Ar8:gsub('ج', 'جہ')
LOL_Ar8 = LOL_Ar8:gsub('ش', 'شہ')
LOL_Ar8 = LOL_Ar8:gsub('س', 'سہ')
LOL_Ar8 = LOL_Ar8:gsub('ي', 'يہ')
LOL_Ar8 = LOL_Ar8:gsub('ب', 'بہ')
LOL_Ar8 = LOL_Ar8:gsub('ل', 'ل')
LOL_Ar8 = LOL_Ar8:gsub('ا', 'آ')
LOL_Ar8 = LOL_Ar8:gsub('ت', 'تہ')
LOL_Ar8 = LOL_Ar8:gsub('ن', 'نہ')
LOL_Ar8 = LOL_Ar8:gsub('م', 'مہ')
LOL_Ar8 = LOL_Ar8:gsub('ك', 'كہ')
LOL_Ar8 = LOL_Ar8:gsub('ط', 'طہ')
LOL_Ar8 = LOL_Ar8:gsub('ظ', 'ظہ')
LOL_Ar8 = LOL_Ar8:gsub('ء', 'ء')
LOL_Ar8 = LOL_Ar8:gsub('ؤ', 'ؤ')
LOL_Ar8 = LOL_Ar8:gsub('ر', 'ر')
LOL_Ar8 = LOL_Ar8:gsub('ى', 'ى')
LOL_Ar8 = LOL_Ar8:gsub('ز', 'ز')
LOL_Ar8 = LOL_Ar8:gsub('و', 'ﯛ̲୭')
LOL_Ar8 = LOL_Ar8:gsub("ه", "ۿۿہ")
local LOL_Ar7  = text:gsub('ض', 'ﺿ̭͠')
LOL_Ar7 = LOL_Ar7:gsub('ص', 'ﺻ͡')
LOL_Ar7 = LOL_Ar7:gsub('ث', 'ﺜ̲')
LOL_Ar7 = LOL_Ar7:gsub('ق', 'ﭰ')
LOL_Ar7 = LOL_Ar7:gsub('ف', 'ﻓ̲')
LOL_Ar7 = LOL_Ar7:gsub('غ', 'ﻏ̲')
LOL_Ar7 = LOL_Ar7:gsub('ع', 'ﻌ̲')
LOL_Ar7 = LOL_Ar7:gsub('ه', 'ﮬ̲̌')
LOL_Ar7 = LOL_Ar7:gsub('خ', 'خٌ')
LOL_Ar7 = LOL_Ar7:gsub('ح', 'ﺣ̅')
LOL_Ar7 = LOL_Ar7:gsub('ج', 'جُ')
LOL_Ar7 = LOL_Ar7:gsub('د', 'ډ̝')
LOL_Ar7 = LOL_Ar7:gsub('ذ', 'ذً')
LOL_Ar7 = LOL_Ar7:gsub('ش', 'ﺷ̲')
LOL_Ar7 = LOL_Ar7:gsub('س', 'ﺳ̉')
LOL_Ar7 = LOL_Ar7:gsub('ي', 'ﯾ̃̐')
LOL_Ar7 = LOL_Ar7:gsub('ب', 'ﺑ̲')
LOL_Ar7 = LOL_Ar7:gsub('ل', 'ا̄ﻟ')
LOL_Ar7 = LOL_Ar7:gsub('ا', 'ﺈ̃')
LOL_Ar7 = LOL_Ar7:gsub('ت', 'ټُ')
LOL_Ar7 = LOL_Ar7:gsub('ن', 'ﻧ̲')
LOL_Ar7 = LOL_Ar7:gsub('م', 'ﻣ̲̉')
LOL_Ar7 = LOL_Ar7:gsub('ك', 'گ')
LOL_Ar7 = LOL_Ar7:gsub('ط', 'ﻁ̲')
LOL_Ar7 = LOL_Ar7:gsub('ئ', ' ْٰئ')
LOL_Ar7 = LOL_Ar7:gsub('ء', 'ء')
LOL_Ar7 = LOL_Ar7:gsub('ؤ', 'ؤ')
LOL_Ar7 = LOL_Ar7:gsub('ر', 'ہڕ')
LOL_Ar7 = LOL_Ar7:gsub('لا', 'ﻟ̲ﺂ̲')
LOL_Ar7 = LOL_Ar7:gsub('ى', 'ى')
LOL_Ar7 = LOL_Ar7:gsub('ة', 'ة')
LOL_Ar7 = LOL_Ar7:gsub('و', 'ۇۈۉ')
LOL_Ar7 = LOL_Ar7:gsub('ز', 'زُ')
LOL_Ar7 = LOL_Ar7:gsub('ظ', 'ﻇ̲')
local LOL_Ar6  = text:gsub('ض', 'ض͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ص', 'ص͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ث', 'ث͜ـ͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ق', 'ق͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ف', 'ف͒͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('غ', 'غ͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ع', 'ع͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('خ', 'خ̐͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ح', 'ح͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ج', 'ج͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ش', 'ش͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('س', 'س͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ي', 'ي͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ب', 'ب͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ل', 'ل͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ا', 'آ')
LOL_Ar6 = LOL_Ar6:gsub('ت', 'ت͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ن', 'ن͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('م', 'م͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ك', 'ڪ͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ط', 'ط͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ظ', 'ظ͜ـ')
LOL_Ar6 = LOL_Ar6:gsub('ء', 'ء')
LOL_Ar6 = LOL_Ar6:gsub('ؤ', 'ؤ')
LOL_Ar6 = LOL_Ar6:gsub('ر', 'ر')
LOL_Ar6 = LOL_Ar6:gsub('ى', 'ى')
LOL_Ar6 = LOL_Ar6:gsub('ز', 'ز')
LOL_Ar6 = LOL_Ar6:gsub('ظ', 'ظـ')
LOL_Ar6 = LOL_Ar6:gsub('و', 'ﯛ̲୭')
LOL_Ar6 = LOL_Ar6:gsub("ه", "ۿۿہ")
local LOL_Ar5  = text:gsub('ض', 'ضۜہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ص', 'ضۜہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ث', 'ثہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ق', 'قྀ̲ہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ف', 'ف͒ہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('غ', 'غہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ع', 'عہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ه', 'هٰہٰٖ')
LOL_Ar5 = LOL_Ar5:gsub('خ', 'خٰ̐ہ ')
LOL_Ar5 = LOL_Ar5:gsub('ح', 'حہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ج', 'جـٰ̲ـہْۧ')
LOL_Ar5 = LOL_Ar5:gsub('د', 'دٰ')
LOL_Ar5 = LOL_Ar5:gsub('ذ', 'ذِٰ')
LOL_Ar5 = LOL_Ar5:gsub('ش', 'شِٰہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('س', 'سٰٓ')
LOL_Ar5 = LOL_Ar5:gsub('ي', 'يِٰہ')
LOL_Ar5 = LOL_Ar5:gsub('ب', 'بّہ')
LOL_Ar5 = LOL_Ar5:gsub('ل', 'لـٰ̲ـہ')
LOL_Ar5 = LOL_Ar5:gsub('ا', 'آ')
LOL_Ar5 = LOL_Ar5:gsub('ت', 'تَہَٰ')
LOL_Ar5 = LOL_Ar5:gsub('ن', 'نَِہ')
LOL_Ar5 = LOL_Ar5:gsub('م', 'مٰ̲ہ')
LOL_Ar5 = LOL_Ar5:gsub('ك', 'ڪٰྀہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ط', 'طۨہٰٰ')
LOL_Ar5 = LOL_Ar5:gsub('ئ', 'ئ ْٰ')
LOL_Ar5 = LOL_Ar5:gsub('ء', 'ء')
LOL_Ar5 = LOL_Ar5:gsub('ؤ', 'ؤ')
LOL_Ar5 = LOL_Ar5:gsub('ر', 'رَ')
LOL_Ar5 = LOL_Ar5:gsub('لا', 'لہا')
LOL_Ar5 = LOL_Ar5:gsub('ى', 'ىْ')
LOL_Ar5 = LOL_Ar5:gsub('ة', 'ة')
LOL_Ar5 = LOL_Ar5:gsub('و', 'وِٰ')
LOL_Ar5 = LOL_Ar5:gsub('ز', 'زَٰ')
LOL_Ar5 = LOL_Ar5:gsub('ظ', 'ظۗہٰٰ')
local LOL_Ar4  = text:gsub('ض', 'ضـٰ̲ـہۜہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ص', 'صـٰ̲ـہۛہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ث', 'ثـٰ̲ـہہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ق', 'قـٰ̲ـہྀ̲ہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ف', 'فـٰ̲ـہ͒ہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('غ', 'غـٰ̲ـہہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ع', 'غـٰ̲ـہہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ه', 'هٰہٰٖ')
LOL_Ar4 = LOL_Ar4:gsub('خ', 'خـٰ̲ـہٰ̐ہ ')
LOL_Ar4 = LOL_Ar4:gsub('ح', 'حـٰ̲ـہہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ج', 'جـٰ̲ـہْۧ')
LOL_Ar4 = LOL_Ar4:gsub('د', 'دٰ')
LOL_Ar4 = LOL_Ar4:gsub('ذ', 'ذِٰ')
LOL_Ar4 = LOL_Ar4:gsub('ش', 'شـٰ̲ـہِٰہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('س', 'شـٰ̲ـہِٰہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ي', 'شـٰ̲ـہِٰہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ب', 'بـٰ̲ـہّہ')
LOL_Ar4 = LOL_Ar4:gsub('ل', 'لـٰ̲ـہ')
LOL_Ar4 = LOL_Ar4:gsub('ا', 'آ')
LOL_Ar4 = LOL_Ar4:gsub('ت', 'تـٰ̲ـہَہَٰ')
LOL_Ar4 = LOL_Ar4:gsub('ن', 'نـٰ̲ـہَِہ')
LOL_Ar4 = LOL_Ar4:gsub('م', 'مـٰ̲ـہٰ̲ہ')
LOL_Ar4 = LOL_Ar4:gsub('ك', 'ڪٰྀہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ط', 'طـٰ̲ـہۨہٰٰ')
LOL_Ar4 = LOL_Ar4:gsub('ئ', 'ئ ْٰ')
LOL_Ar4 = LOL_Ar4:gsub('ء', 'ء')
LOL_Ar4 = LOL_Ar4:gsub('ؤ', 'ؤ')
LOL_Ar4 = LOL_Ar4:gsub('ر', 'رَ')
LOL_Ar4 = LOL_Ar4:gsub('لا', 'لہا')
LOL_Ar4 = LOL_Ar4:gsub('ى', 'ىْ')
LOL_Ar4 = LOL_Ar4:gsub('ة', 'ة')
LOL_Ar4 = LOL_Ar4:gsub('و', 'وِٰ')
LOL_Ar4 = LOL_Ar4:gsub('ز', 'زَٰ')
LOL_Ar4 = LOL_Ar4:gsub('ظ', 'ظۗہٰٰ')
local LOL_Ar3  = text:gsub('ض', 'ض')
LOL_Ar3 = LOL_Ar3:gsub('ص', 'ص')
LOL_Ar3 = LOL_Ar3:gsub('ث', 'ثہ')
LOL_Ar3 = LOL_Ar3:gsub('ق', 'ق')
LOL_Ar3 = LOL_Ar3:gsub('ف', 'فُہ')
LOL_Ar3 = LOL_Ar3:gsub('غ', 'غہ')
LOL_Ar3 = LOL_Ar3:gsub('ع', 'عہ')
LOL_Ar3 = LOL_Ar3:gsub('ه', 'هٰہٰٖ')
LOL_Ar3 = LOL_Ar3:gsub('خ', 'خہ')
LOL_Ar3 = LOL_Ar3:gsub('ح', 'حہ')
LOL_Ar3 = LOL_Ar3:gsub('ج', 'جہ')
LOL_Ar3 = LOL_Ar3:gsub('د', 'د')
LOL_Ar3 = LOL_Ar3:gsub('ذ', 'ذ')
LOL_Ar3 = LOL_Ar3:gsub('ش', 'شہ')
LOL_Ar3 = LOL_Ar3:gsub('س', 'سہ')
LOL_Ar3 = LOL_Ar3:gsub('ي', 'يہ')
LOL_Ar3 = LOL_Ar3:gsub('ب', 'بّ')
LOL_Ar3 = LOL_Ar3:gsub('ل', 'لہ')
LOL_Ar3 = LOL_Ar3:gsub('ا', 'ا')
LOL_Ar3 = LOL_Ar3:gsub('ت', 'تہ')
LOL_Ar3 = LOL_Ar3:gsub('ن', 'نٰہٰٖ')
LOL_Ar3 = LOL_Ar3:gsub('م', 'مٰہٰٖ')
LOL_Ar3 = LOL_Ar3:gsub('ك', 'كُہ')
LOL_Ar3 = LOL_Ar3:gsub('ط', 'طہ')
LOL_Ar3 = LOL_Ar3:gsub('ئ', 'ئ ْٰ')
LOL_Ar3 = LOL_Ar3:gsub('ء', 'ء')
LOL_Ar3 = LOL_Ar3:gsub('ؤ', 'ؤ')
LOL_Ar3 = LOL_Ar3:gsub('ر', 'رَ')
LOL_Ar3 = LOL_Ar3:gsub('لا', 'لہا')
LOL_Ar3 = LOL_Ar3:gsub('ى', 'ىْ')
LOL_Ar3 = LOL_Ar3:gsub('ة', 'ة')
LOL_Ar3 = LOL_Ar3:gsub('و', 'و')
LOL_Ar3 = LOL_Ar3:gsub('ز', 'ز')
LOL_Ar3 = LOL_Ar3:gsub('ظ', 'ظۗہٰٰ')
local LOL_Ar2  = text:gsub('ض', 'ضَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ص', 'صَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ث', 'ثَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ق', 'قَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ف', 'فَٰ͒ـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('غ', 'غَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ع', 'عَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('خ', 'خَٰ̐ـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ح', 'حَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ج', 'جَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ش', 'شَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('س', 'سَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ي', 'يَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ب', 'بَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ل', 'لَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ا', 'آ')
LOL_Ar2 = LOL_Ar2:gsub('ت', 'تَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ن', 'نَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('م', 'مَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ك', 'ڪَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ط', 'طَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ظ', 'ظَٰـُـٰٓ')
LOL_Ar2 = LOL_Ar2:gsub('ء', 'ء')
LOL_Ar2 = LOL_Ar2:gsub('ؤ', 'ؤ')
LOL_Ar2 = LOL_Ar2:gsub('ر', 'ر')
LOL_Ar2 = LOL_Ar2:gsub('ى', 'ى')
LOL_Ar2 = LOL_Ar2:gsub('ز', 'ز')
LOL_Ar2 = LOL_Ar2:gsub('و', 'ﯛ̲୭')
LOL_Ar2 = LOL_Ar2:gsub("ه", "ۿۿہ")
local LOL_Ar1  = text:gsub('ض', 'ضِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ص', 'صِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ث', 'ثِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ق', 'قِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ف', 'فِٰ͒ـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('غ', 'غِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ع', 'عِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('خ', 'خِٰ̐ـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ح', 'حِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ج', 'جِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ش', 'شِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('س', 'سِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ي', 'يِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ب', 'بِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ل', 'لِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ا', 'آ')
LOL_Ar1 = LOL_Ar1:gsub('ت', 'تِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ن', 'نِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('م', 'مِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ك', 'ڪِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ط', 'طِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ظ', 'ظِٰـِۢ')
LOL_Ar1 = LOL_Ar1:gsub('ء', 'ء')
LOL_Ar1 = LOL_Ar1:gsub('ؤ', 'ؤ')
LOL_Ar1 = LOL_Ar1:gsub('ر', 'ر')
LOL_Ar1 = LOL_Ar1:gsub('ى', 'ى')
LOL_Ar1 = LOL_Ar1:gsub('ز', 'ز')
LOL_Ar1 = LOL_Ar1:gsub('و', 'ﯛ̲୭')
LOL_Ar1 = LOL_Ar1:gsub("ه", "ۿۿہ")
Text_Zhrfa = '1 - `'..LOL_Ar1..'`'..
'\n2 - `'..LOL_Ar2..'`'..
'\n3 - `'..LOL_Ar3..' `'..
'\n4 - `'..LOL_Ar4..'`'..
'\n5 - `'..LOL_Ar5..' `'..
'\n6 - `'..LOL_Ar6..'`'..
'\n7 - `'..LOL_Ar7..'`'..
'\n8 - `'..LOL_Ar8..'`'..
'\n9 - `'..LOL_Ar9..'`'..
'\n10 - `'..LOL_Ar10..'`'..
'\n11 - `'..LOL_Ar11..'`'..
'\n12 - `'..LOL_Ar12..'`'..
'\n13 - `'..LOL_Ar13..'`'
Text_Zhrfa = Text_Zhrfa.."\n• اضغط على الاسم ليتم نسخه "
return Lualoner.sendText(msg_chat_id,msg_id,Text_Zhrfa,"md",true)
end
if Redis:get(Theloner..":lolEmoje:en"..msg.sender_id.user_id) then
Redis:del(Theloner..":lolEmoje:en"..msg.sender_id.user_id)
if string.len(text) > 300 then
return Lualoner.sendText(msg_chat_id,msg_id,"• لا يمكنك زخرفه اكثر من 20 حرف \n• ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)  
elseif text:match("\n") then
return Lualoner.sendText(msg_chat_id,msg_id,"• لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
text = text:gsub('A','a')
text = text:gsub('S','s')
text = text:gsub('D','d')
text = text:gsub('F','f')
text = text:gsub('G','g')
text = text:gsub('H','h')
text = text:gsub('J','j')
text = text:gsub('K','k')
text = text:gsub('L','l')
text = text:gsub('Q','q')
text = text:gsub('W','w')
text = text:gsub('E','e')
text = text:gsub('R','r')
text = text:gsub('T','t')
text = text:gsub('Y','y')
text = text:gsub('U','u')
text = text:gsub('I','i')
text = text:gsub('O','o')
text = text:gsub('P','p')
text = text:gsub('Z','z')
text = text:gsub('X','x')
text = text:gsub('C','c')
text = text:gsub('V','v')
text = text:gsub('B','b')
text = text:gsub('N','n')
text = text:gsub('M','m')
local Zh_En1  = text:gsub('q', '𝚀')
Zh_En1 = Zh_En1:gsub('w', '𝚆')
Zh_En1 = Zh_En1:gsub('e', '𝙴')
Zh_En1 = Zh_En1:gsub('r', '𝚁')
Zh_En1 = Zh_En1:gsub('t', '𝚃')
Zh_En1 = Zh_En1:gsub('y', '𝚈')
Zh_En1 = Zh_En1:gsub('u', '𝚄')
Zh_En1 = Zh_En1:gsub('i', '𝙸')
Zh_En1 = Zh_En1:gsub('o', '𝙾')
Zh_En1 = Zh_En1:gsub('p', '𝙿')
Zh_En1 = Zh_En1:gsub('a', '??')
Zh_En1 = Zh_En1:gsub('s', '𝚂')
Zh_En1 = Zh_En1:gsub('d', '𝙳')
Zh_En1 = Zh_En1:gsub('f', '𝙵')
Zh_En1 = Zh_En1:gsub('g', '𝙶')
Zh_En1 = Zh_En1:gsub('h', '𝙷')
Zh_En1 = Zh_En1:gsub('j', '𝙹')
Zh_En1 = Zh_En1:gsub('k', '𝙺')
Zh_En1 = Zh_En1:gsub('I', '𝙻')
Zh_En1 = Zh_En1:gsub('z', '𝚉')
Zh_En1 = Zh_En1:gsub('x', '𝚇')
Zh_En1 = Zh_En1:gsub('c', '𝙲')
Zh_En1 = Zh_En1:gsub('v', '𝚅')
Zh_En1 = Zh_En1:gsub('b', '𝙱')
Zh_En1 = Zh_En1:gsub('n', '𝙽')
Zh_En1 = Zh_En1:gsub('m', '𝙼')
local LOL_En2  = text:gsub('q','𝒒 ')
LOL_En2 = LOL_En2:gsub('w','𝒘')
LOL_En2 = LOL_En2:gsub('e','𝒆')
LOL_En2 = LOL_En2:gsub('r','𝒓')
LOL_En2 = LOL_En2:gsub('t','??')
LOL_En2 = LOL_En2:gsub('y','𝒚')
LOL_En2 = LOL_En2:gsub('u','𝒖')
LOL_En2 = LOL_En2:gsub('i','𝒊')
LOL_En2 = LOL_En2:gsub('o','𝒐')
LOL_En2 = LOL_En2:gsub('p','𝒑')
LOL_En2 = LOL_En2:gsub('a','𝒂')
LOL_En2 = LOL_En2:gsub('s','𝒔')
LOL_En2 = LOL_En2:gsub('d','𝒅')
LOL_En2 = LOL_En2:gsub('f','𝒇')
LOL_En2 = LOL_En2:gsub('g','𝒈')
LOL_En2 = LOL_En2:gsub('h','𝒉')
LOL_En2 = LOL_En2:gsub('j','𝒋')
LOL_En2 = LOL_En2:gsub('k','𝒌')
LOL_En2 = LOL_En2:gsub('l','𝒍')
LOL_En2 = LOL_En2:gsub('m','𝒎')
LOL_En2 = LOL_En2:gsub('n','𝒏')
LOL_En2 = LOL_En2:gsub('b','𝒃')
LOL_En2 = LOL_En2:gsub('v','𝒗')
LOL_En2 = LOL_En2:gsub('c','𝒄')
LOL_En2 = LOL_En2:gsub('x','𝒙')
LOL_En2 = LOL_En2:gsub('z','𝒛 ')
local LOL_En3  = text:gsub('q', '𝑄')
LOL_En3 = LOL_En3:gsub('w', '𝑊')
LOL_En3 = LOL_En3:gsub('e', '𝐸')
LOL_En3 = LOL_En3:gsub('r', '𝑅')
LOL_En3 = LOL_En3:gsub('t', '𝑇')
LOL_En3 = LOL_En3:gsub('y', '𝑌')
LOL_En3 = LOL_En3:gsub('Y', '𝑌')
LOL_En3 = LOL_En3:gsub('u', '𝐔')
LOL_En3 = LOL_En3:gsub('i', '𝐼')
LOL_En3 = LOL_En3:gsub('o', '𝑂')
LOL_En3 = LOL_En3:gsub('p', '𝑃')
LOL_En3 = LOL_En3:gsub('a', '𝐴')
LOL_En3 = LOL_En3:gsub('s', '𝑆')
LOL_En3 = LOL_En3:gsub('d', '𝐷')
LOL_En3 = LOL_En3:gsub('f', '𝐹')
LOL_En3 = LOL_En3:gsub('g', '𝐺')
LOL_En3 = LOL_En3:gsub('h', '𝐻')
LOL_En3 = LOL_En3:gsub('j', '𝐽')
LOL_En3 = LOL_En3:gsub('k', '𝐾')
LOL_En3 = LOL_En3:gsub('I', '𝐿')
LOL_En3 = LOL_En3:gsub('z', '𝑍')
LOL_En3 = LOL_En3:gsub('x', '𝑋')
LOL_En3 = LOL_En3:gsub('c', '𝐶')
LOL_En3 = LOL_En3:gsub('v', '𝑉')
LOL_En3 = LOL_En3:gsub('b', 'b')
LOL_En3 = LOL_En3:gsub('n', '𝑁')
LOL_En3 = LOL_En3:gsub('m', '𝑀')
local LOL_En4  = text:gsub('q', '𝐐')
LOL_En4 = LOL_En4:gsub('w', '𝐖')
LOL_En4 = LOL_En4:gsub('e', '𝐄')
LOL_En4 = LOL_En4:gsub('r', '𝐑')
LOL_En4 = LOL_En4:gsub('t', '𝐓')
LOL_En4 = LOL_En4:gsub('y', '𝐘')
LOL_En4 = LOL_En4:gsub('u', '𝗨')
LOL_En4 = LOL_En4:gsub('i', '𝐈')
LOL_En4 = LOL_En4:gsub('o', '𝐎')
LOL_En4 = LOL_En4:gsub('p', '𝐏')
LOL_En4 = LOL_En4:gsub('a', '𝐀')
LOL_En4 = LOL_En4:gsub('s', '𝐒')
LOL_En4 = LOL_En4:gsub('d', '𝐃')
LOL_En4 = LOL_En4:gsub('f', '𝐅')
LOL_En4 = LOL_En4:gsub('g', '𝐆')
LOL_En4 = LOL_En4:gsub('h', '𝐇')
LOL_En4 = LOL_En4:gsub('j', '𝐉')
LOL_En4 = LOL_En4:gsub('k', '𝐊')
LOL_En4 = LOL_En4:gsub('I', '𝐋')
LOL_En4 = LOL_En4:gsub('z', '𝐙')
LOL_En4 = LOL_En4:gsub('x', '𝐗')
LOL_En4 = LOL_En4:gsub('c', '𝐂')
LOL_En4 = LOL_En4:gsub('v', '𝐕')
LOL_En4 = LOL_En4:gsub('b', '𝐁')
LOL_En4 = LOL_En4:gsub('n', '𝐍')
LOL_En4 = LOL_En4:gsub('m', '𝐌')
local LOL_En5  = text:gsub('a', 'ᴀ')
LOL_En5 = LOL_En5:gsub('b', 'ʙ')
LOL_En5 = LOL_En5:gsub('c', 'ᴄ')
LOL_En5 = LOL_En5:gsub('d', 'ᴅ')
LOL_En5 = LOL_En5:gsub('e', 'ᴇ')
LOL_En5 = LOL_En5:gsub('f', 'ᴈ')
LOL_En5 = LOL_En5:gsub('g', 'ɢ')
LOL_En5 = LOL_En5:gsub('h', 'ʜ')
LOL_En5 = LOL_En5:gsub('i', 'ɪ')
LOL_En5 = LOL_En5:gsub('j', 'ᴊ')
LOL_En5 = LOL_En5:gsub('k', 'ᴋ')
LOL_En5 = LOL_En5:gsub('l', 'ʟ')
LOL_En5 = LOL_En5:gsub('m', 'ᴍ')
LOL_En5 = LOL_En5:gsub('n', 'ɴ')
LOL_En5 = LOL_En5:gsub('o', 'ᴏ')
LOL_En5 = LOL_En5:gsub('p', 'ᴘ')
LOL_En5 = LOL_En5:gsub('q', 'ᴓ')
LOL_En5 = LOL_En5:gsub('r', 'ʀ')
LOL_En5 = LOL_En5:gsub('s', 'ᴤ')
LOL_En5 = LOL_En5:gsub('t', 'ᴛ')
LOL_En5 = LOL_En5:gsub('u', 'ᴜ')
LOL_En5 = LOL_En5:gsub('v', 'ᴠ')
LOL_En5 = LOL_En5:gsub('w', 'ᴡ')
LOL_En5 = LOL_En5:gsub('x', 'ᴥ')
LOL_En5 = LOL_En5:gsub('y', 'ʏ')
LOL_En5 = LOL_En5:gsub('z', 'ᴢ')
local LOL_En6  = text:gsub('q','𝗤 ')
LOL_En6 = LOL_En6:gsub('w','𝗪')
LOL_En6 = LOL_En6:gsub('e','𝗘')
LOL_En6 = LOL_En6:gsub('r','𝗥')
LOL_En6 = LOL_En6:gsub('t','𝗧')
LOL_En6 = LOL_En6:gsub('u','𝗨')
LOL_En6 = LOL_En6:gsub('y','𝗬')
LOL_En6 = LOL_En6:gsub('l','𝗜')
LOL_En6 = LOL_En6:gsub('o','𝗢')
LOL_En6 = LOL_En6:gsub('p','𝗣')
LOL_En6 = LOL_En6:gsub('a','𝗔')
LOL_En6 = LOL_En6:gsub('s','𝗦')
LOL_En6 = LOL_En6:gsub('d','𝗗')
LOL_En6 = LOL_En6:gsub('f','𝗙')
LOL_En6 = LOL_En6:gsub('g','𝗚')
LOL_En6 = LOL_En6:gsub('h','𝗛')
LOL_En6 = LOL_En6:gsub('j','𝗝')
LOL_En6 = LOL_En6:gsub('k','𝗞')
LOL_En6 = LOL_En6:gsub('l','𝗟')
LOL_En6 = LOL_En6:gsub('m','𝗠')
LOL_En6 = LOL_En6:gsub('n','𝗡')
LOL_En6 = LOL_En6:gsub('b','𝗕')
LOL_En6 = LOL_En6:gsub('v','𝗩')
LOL_En6 = LOL_En6:gsub('c','𝗖')
LOL_En6 = LOL_En6:gsub('x','𝗫')
LOL_En6 = LOL_En6:gsub('z','𝗭 ')
local LOL_En7  = text:gsub('q','ǫ ')
LOL_En7 = LOL_En7:gsub('w','ᴡ')
LOL_En7 = LOL_En7:gsub('e','ᴇ')
LOL_En7 = LOL_En7:gsub('r','ʀ')
LOL_En7 = LOL_En7:gsub('t','ᴛ')
LOL_En7 = LOL_En7:gsub('y','ʏ')
LOL_En7 = LOL_En7:gsub('u','𝓾')
LOL_En7 = LOL_En7:gsub('i','ɪ')
LOL_En7 = LOL_En7:gsub('o','ᴏ')
LOL_En7 = LOL_En7:gsub('p','ᴘ')
LOL_En7 = LOL_En7:gsub('a','ᴀ')
LOL_En7 = LOL_En7:gsub('s','ѕ')
LOL_En7 = LOL_En7:gsub('d','ᴅ')
LOL_En7 = LOL_En7:gsub('f','ғ')
LOL_En7 = LOL_En7:gsub('g','ɢ')
LOL_En7 = LOL_En7:gsub('h','ʜ')
LOL_En7 = LOL_En7:gsub('j','ᴊ')
LOL_En7 = LOL_En7:gsub('k','ᴋ')
LOL_En7 = LOL_En7:gsub('l','ʟ')
LOL_En7 = LOL_En7:gsub('m','ᴍ')
LOL_En7 = LOL_En7:gsub('n','ɴ')
LOL_En7 = LOL_En7:gsub('b','ʙ')
LOL_En7 = LOL_En7:gsub('v','ᴠ')
LOL_En7 = LOL_En7:gsub('c','ᴄ')
LOL_En7 = LOL_En7:gsub('x','х')
LOL_En7 = LOL_En7:gsub('z','ᴢ ')
local LOL_En8  = text:gsub('q','𝗾 ')
LOL_En8 = LOL_En8:gsub('w','𝘄')
LOL_En8 = LOL_En8:gsub('e','𝗲')
LOL_En8 = LOL_En8:gsub('r','𝗿')
LOL_En8 = LOL_En8:gsub('t','𝘁')
LOL_En8 = LOL_En8:gsub('u','𝘂')
LOL_En8 = LOL_En8:gsub('y','𝘆')
LOL_En8 = LOL_En8:gsub('i',' 𝗶')
LOL_En8 = LOL_En8:gsub('o','𝗼')
LOL_En8 = LOL_En8:gsub('p','𝗽')
LOL_En8 = LOL_En8:gsub('a','𝗮')
LOL_En8 = LOL_En8:gsub('s','𝘀')
LOL_En8 = LOL_En8:gsub('d','𝗱')
LOL_En8 = LOL_En8:gsub('f','𝗳')
LOL_En8 = LOL_En8:gsub('g','𝗴')
LOL_En8 = LOL_En8:gsub('h','𝗵')
LOL_En8 = LOL_En8:gsub('j','j')
LOL_En8 = LOL_En8:gsub('k','𝗸')
LOL_En8 = LOL_En8:gsub('l','𝗹')
LOL_En8 = LOL_En8:gsub('m','𝗺')
LOL_En8 = LOL_En8:gsub('n','𝗻')
LOL_En8 = LOL_En8:gsub('b','𝗯')
LOL_En8 = LOL_En8:gsub('v','𝘃')
LOL_En8 = LOL_En8:gsub('c','𝗰')
LOL_En8 = LOL_En8:gsub('x','𝘅')
LOL_En8 = LOL_En8:gsub('z','𝘇 ')
local LOL_En9  = text:gsub('q','𝖖 ')
LOL_En9 = LOL_En9:gsub('w','𝖜')
LOL_En9 = LOL_En9:gsub('e','𝖊')
LOL_En9 = LOL_En9:gsub('r','𝖗')
LOL_En9 = LOL_En9:gsub('t','𝖙')
LOL_En9 = LOL_En9:gsub('y','𝖞')
LOL_En9 = LOL_En9:gsub('u','𝖚')
LOL_En9 = LOL_En9:gsub('i',' 𝖎')
LOL_En9 = LOL_En9:gsub('o','𝖔')
LOL_En9 = LOL_En9:gsub('p','𝖕')
LOL_En9 = LOL_En9:gsub('a','??')
LOL_En9 = LOL_En9:gsub('s','𝖘')
LOL_En9 = LOL_En9:gsub('d','𝖉')
LOL_En9 = LOL_En9:gsub('f','𝖋')
LOL_En9 = LOL_En9:gsub('g','𝖌')
LOL_En9 = LOL_En9:gsub('h','𝖍')
LOL_En9 = LOL_En9:gsub('j','𝖏')
LOL_En9 = LOL_En9:gsub('k','𝖐')
LOL_En9 = LOL_En9:gsub('l','𝖑')
LOL_En9 = LOL_En9:gsub('m','𝖒')
LOL_En9 = LOL_En9:gsub('n','𝖓')
LOL_En9 = LOL_En9:gsub('b','𝖇')
LOL_En9 = LOL_En9:gsub('v','𝖛')
LOL_En9 = LOL_En9:gsub('c','𝖈')
LOL_En9 = LOL_En9:gsub('x','𝖝')
LOL_En9 = LOL_En9:gsub('z','𝖟 ')
local LOL_En10 = text:gsub('q','ᵠ ')
LOL_En10 = LOL_En10:gsub('w','ᵂ')
LOL_En10 = LOL_En10:gsub('e','ᴱ')
LOL_En10 = LOL_En10:gsub('r','ᴿ')
LOL_En10 = LOL_En10:gsub('t','ᵀ')
LOL_En10 = LOL_En10:gsub('u','ᵁ')
LOL_En10 = LOL_En10:gsub('y','ʸ')
LOL_En10 = LOL_En10:gsub('i','ᴵ')
LOL_En10 = LOL_En10:gsub('o','ᴼ')
LOL_En10 = LOL_En10:gsub('p','ᴾ')
LOL_En10 = LOL_En10:gsub('a','ᴬ')
LOL_En10 = LOL_En10:gsub('s','ˁ')
LOL_En10 = LOL_En10:gsub('d','ᴰ')
LOL_En10 = LOL_En10:gsub('f','ᶠ')
LOL_En10 = LOL_En10:gsub('g','ᴳ')
LOL_En10 = LOL_En10:gsub('h','ᴴ')
LOL_En10 = LOL_En10:gsub('j','ᴶ')
LOL_En10 = LOL_En10:gsub('k','ᴷ')
LOL_En10 = LOL_En10:gsub('l','ᴸ')
LOL_En10 = LOL_En10:gsub('m','ᴹ')
LOL_En10 = LOL_En10:gsub('n','ᴺ')
LOL_En10 = LOL_En10:gsub('b','ᴮ')
LOL_En10 = LOL_En10:gsub('v','ᵛ')
LOL_En10 = LOL_En10:gsub('c','ᶜ')
LOL_En10 = LOL_En10:gsub('x','ˣ')
LOL_En10 = LOL_En10:gsub('z','ᶻ')
local LOL_En11 = text:gsub('q','ᑫ ')
LOL_En11 = LOL_En11:gsub('w','ᗯ')
LOL_En11 = LOL_En11:gsub('e','E')
LOL_En11 = LOL_En11:gsub('r','ᖇ')
LOL_En11 = LOL_En11:gsub('t',' T')
LOL_En11 = LOL_En11:gsub('u','ᑌ')
LOL_En11 = LOL_En11:gsub('y','Y')
LOL_En11 = LOL_En11:gsub('i','I')
LOL_En11 = LOL_En11:gsub('o','O')
LOL_En11 = LOL_En11:gsub('p','ᑭ')
LOL_En11 = LOL_En11:gsub('a','ᗩ')
LOL_En11 = LOL_En11:gsub('s',' ᔕ')
LOL_En11 = LOL_En11:gsub('d','ᗪ')
LOL_En11 = LOL_En11:gsub('f','f')
LOL_En11 = LOL_En11:gsub('g','G')
LOL_En11 = LOL_En11:gsub('h','ᕼ')
LOL_En11 = LOL_En11:gsub('j','ᒍ')
LOL_En11 = LOL_En11:gsub('k','K')
LOL_En11 = LOL_En11:gsub('l','ᒪ')
LOL_En11 = LOL_En11:gsub('m','ᗰ')
LOL_En11 = LOL_En11:gsub('n','ᑎ')
LOL_En11 = LOL_En11:gsub('b','ᗷ')
LOL_En11 = LOL_En11:gsub('v','ᐯ')
LOL_En11 = LOL_En11:gsub('c','ᑕ')
LOL_En11 = LOL_En11:gsub('x','᙭')
LOL_En11 = LOL_En11:gsub('z','ᘔ')
local LOL_En12 = text:gsub('q','ℚ ')
LOL_En12 = LOL_En12:gsub('w','𝕎')
LOL_En12 = LOL_En12:gsub('e',' 𝔼')
LOL_En12 = LOL_En12:gsub('r','ℝ')
LOL_En12 = LOL_En12:gsub('t','𝕋')
LOL_En12 = LOL_En12:gsub('u','𝕌')
LOL_En12 = LOL_En12:gsub('y',' 𝕐')
LOL_En12 = LOL_En12:gsub('i','𝕀')
LOL_En12 = LOL_En12:gsub('o','𝕆')
LOL_En12 = LOL_En12:gsub('p','ℙ')
LOL_En12 = LOL_En12:gsub('a','𝔸')
LOL_En12 = LOL_En12:gsub('s','𝕊')
LOL_En12 = LOL_En12:gsub('d','𝔻')
LOL_En12 = LOL_En12:gsub('f','𝔽')
LOL_En12 = LOL_En12:gsub('g','𝔾')
LOL_En12 = LOL_En12:gsub('h','ℍ')
LOL_En12 = LOL_En12:gsub('j','𝔾')
LOL_En12 = LOL_En12:gsub('k','𝕂')
LOL_En12 = LOL_En12:gsub('l','𝕃')
LOL_En12 = LOL_En12:gsub('m','𝕄')
LOL_En12 = LOL_En12:gsub('n','ℕ')
LOL_En12 = LOL_En12:gsub('b','𝔹')
LOL_En12 = LOL_En12:gsub('v','𝕍')
LOL_En12 = LOL_En12:gsub('c','ℂ')
LOL_En12 = LOL_En12:gsub('x',' 𝕏')
LOL_En12 = LOL_En12:gsub('z','ℤ')
local LOL_En13 = text:gsub('q','ᵟ ')
LOL_En13 = LOL_En13:gsub('w','ᵂ')
LOL_En13 = LOL_En13:gsub('e','ᴱ')
LOL_En13 = LOL_En13:gsub('r','ᴿ')
LOL_En13 = LOL_En13:gsub('t','ᵀ')
LOL_En13 = LOL_En13:gsub('y','ᵞ')
LOL_En13 = LOL_En13:gsub('u','𝐔')
LOL_En13 = LOL_En13:gsub('i','ᴵ')
LOL_En13 = LOL_En13:gsub('o','ᴼ')
LOL_En13 = LOL_En13:gsub('p','ᴾ')
LOL_En13 = LOL_En13:gsub('a','ᴬ')
LOL_En13 = LOL_En13:gsub('s','ˢ')
LOL_En13 = LOL_En13:gsub('d','ᴰ')
LOL_En13 = LOL_En13:gsub('f','ᶠ')
LOL_En13 = LOL_En13:gsub('g','ᴳ')
LOL_En13 = LOL_En13:gsub('h','ᴴ')
LOL_En13 = LOL_En13:gsub('j','ᴶ')
LOL_En13 = LOL_En13:gsub('k','ᴷ')
LOL_En13 = LOL_En13:gsub('l','ᴸ')
LOL_En13 = LOL_En13:gsub('m','ᴹ')
LOL_En13 = LOL_En13:gsub('n','ᴺ')
LOL_En13 = LOL_En13:gsub('b','ᴮ')
LOL_En13 = LOL_En13:gsub('v','ᵛ')
LOL_En13 = LOL_En13:gsub('c','ᶜ')
LOL_En13 = LOL_En13:gsub('x','ˣ')
LOL_En13 = LOL_En13:gsub('z','ᶻ')
Text_Zhrfa = '1 - `'..Zh_En1..'`'..
'\n2 - `'..LOL_En2..'`'..
'\n3 - `'..LOL_En3..'`'..
'\n4 - `'..LOL_En4..'`'..
'\n5 - `'..LOL_En5..' `'..
'\n6 - `'..LOL_En6..'`'..
'\n7 - `'..LOL_En7..'`'..
'\n8 - `'..LOL_En8..'`'..
'\n9 - `'..LOL_En9..'`'..
'\n10 - `'..LOL_En10..'`'..
'\n11 - `'..LOL_En11..'`'..
'\n12 - `'..LOL_En12..'`'..
'\n13 - `'..LOL_En13..'`'
Text_Zhrfa = Text_Zhrfa.."\n• اضغط على الاسم ليتم نسخه "
return Lualoner.sendText(msg_chat_id,msg_id,Text_Zhrfa,"md",true)  
end
if chat_type(msg.chat_id) == "UserBot" then --- بدايه الخاص
if text == "الاحصائيات" then
if not msg.ControllerBot then 
return
end 
local list = Redis:smembers(Theloner.."statisticsRedis")
Lualoner.sendText(msg_chat_id,msg_id,"•  عدد مشتركين بوتك ( * "..#list.." * ) مشترك")
return false 
end
if text == 'رفع النسخه الاحتياطيه' and data.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and data.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return
end 
local Message_Reply = Lualoner.getMessage(data.chat_id, data.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= Theloner..'.json' then
return Lualoner.sendText(msg_chat_id,msg_id,'•  عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- اسم الملف
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) -- يحتاج فاكشن download
local Get_Info = io.open("./"..Theloner.."lol.json","r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Theloner) ~= tonumber(FilesJson.BotId) then
return Lualoner.sendText(msg_chat_id,msg_id,'•  عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- ايدي البوت
Lualoner.sendText(msg_chat_id,msg_id,'• جاري استرجاع المشتركين والجروبات ...')
Y = 0
for k,v in pairs(FilesJson.oooww) do
Y = Y + 1
Redis:sadd(Theloner..'statisticsRedis',v)  
end
end
end
if text == "جلب نسخه" then
if not msg.ControllerBot then 
return
end 
local oooww = Redis:smembers(Theloner.."statisticsRedis")
local Get_Json = '{"BotId": '..Theloner..','  
if #oooww ~= 0 then 
Get_Json = Get_Json..'"oooww":['  
for k,v in pairs(oooww) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
local File = io.open('./'..Theloner..'lol.json', "w")
File:write(Get_Json)
File:close()
return Lualoner.sendDocument(msg_chat_id,msg_id,'./'..Theloner..'.json', '\n• اهلا مطوري تم جلب نسخه\n• تحتوي على : ( *'..#oooww..'* )\n-', 'md')
end

if text == 'تحديث الملفات' or text == 'تحديث' then
if msg.ControllerBot then
print('User Id : '..msg_user_send_id)
Lualoner.sendText(msg_chat_id,msg_id, "• تم تحديث الملفات ","md",true)
dofile('Theloner.lua')  
end
end
if Redis:get(Theloner.."Theloner:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(Theloner.."Theloner:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return Lualoner.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه","md",true)  
end 
local list = Redis:smembers(Theloner..'statisticsRedis')  
if msg.content.video_note then
for k,v in pairs(list) do 
Lualoner.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
Lualoner.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
Lualoner.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
Lualoner.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
Lualoner.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
Lualoner.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
Lualoner.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
Lualoner.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
Lualoner.sendText(v,0,text,"md",true)
end
end
Lualoner.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(Theloner.."Theloner:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
if text=='اذاعه' then 
if not msg.ControllerBot then 
return
end 
Redis:setex(Theloner.."Theloner:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
Lualoner.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل ( الغاء الامر )
]],"md",true)  
return false
end

if text == 'قسم الاحصائيات' then
if not msg.ControllerBot then 
return
end 
local reply_markup = Lualoner.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'جلب نسخه',type = 'text'},{text = 'الاحصائيات',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,'  • اهلا بك عزيزي المطور  . ', 'md', false, false, false, false, reply_markup)
end
if text == 'قسم الاجباري' then
local reply_markup = Lualoner.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تعطيل الاشتراك الاجباري',type = 'text'},{text = 'تفعيل الاشتراك الاجباري',type = 'text'}, --- 
},
{
{text = 'تغيير الاشتراك الاجباري',type = 'text'},
},
{
{text = 'الغاء الامر',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,'  • اهلا بك عزيزي المطور  . ', 'md', false, false, false, false, reply_markup)
end
if text == 'قسم الاذاعه' then
if not msg.ControllerBot then 
return
end 
local reply_markup = Lualoner.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'الغاء الامر',type = 'text'},{text = 'اذاعه',type = 'text'},
},
{
{text = 'رجوع',type = 'text'},
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,'  • اهلا بك عزيزي المطور  . ', 'md', false, false, false, false, reply_markup)
end
if text == 'رجوع' then
if not msg.ControllerBot then 
return
end 
local reply_markup = Lualoner.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قسم الاذاعه',type = 'text'},{text = 'قسم الاحصائيات',type = 'text'},
},
{
{text = 'تغيير كليشه ستارت',type = 'text'},{text = 'حذف كليشه ستارت',type = 'text'},
},
{
{text = 'قسم الاجباري',type = 'text'},
},
{
{text = 'الغاء الامر',type = 'text'},
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,'  • اهلا بك عزيزي المطور  . ', 'md', false, false, false, false, reply_markup)
end

if text == '/start' then
if ChannelJoin(msg) == false then
local reply_markup = Lualoner.replyMarkup{
type = 'inline',
data = {
{
{text = ''..Redis:get(Theloner..'Theloner:Channel:Join:Name')..'', url = 't.me/'..Redis:get(Theloner..'Theloner:Channel:Join')},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• اشترك بالقناه اول ',"md",false, false, false, false, reply_markup)
end
Redis:sadd(Theloner..'statisticsRedis',msg.sender_id.user_id)  
local ban = Lualoner.getUser(Sudo_Id)
if ban.username then
end
if not msg.ControllerBot then
if not Redis:get(Theloner.."Theloner:Start:Bot") then
local Tayzistart = '- اهلا عزيزي انا بوت زخرفه\n- ارسل اسمك لازخرفه\n-'
local reply_markup = Lualoner.replyMarkup{
type = 'inline',
data = {
{
{text = '- عربي', data = msg.sender_id.user_id..'/Zhrfaar'},{text = '- English', data = msg.sender_id.user_id..'/Zhrfaen'},
},
{
{text = 'قناه تحديثات', url = 't.me/LuaProjects'},  ---- حط {text = 'قناه تحديثات', url = 't.me/LDD7D'}, 
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,Tayzistart,"md",false, false, false, false, reply_markup)
else
local reply_markup = Lualoner.replyMarkup{
type = 'inline',
data = {
{
{text = '- عربي', data = msg.sender_id.user_id..'/Zhrfaar'},{text = '- English', data = msg.sender_id.user_id..'/Zhrfaen'},
},
{
{text = 'قناه تحديثات', url = 't.me/LuaProjects'},  ---- حط 
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,Redis:get(Theloner.."Theloner:Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = Lualoner.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قسم الاذاعه',type = 'text'},{text = 'قسم الاحصائيات',type = 'text'},
},
{
{text = 'تغيير كليشه ستارت',type = 'text'},{text = 'حذف كليشه ستارت',type = 'text'},
},
{
{text = 'قسم الاجباري',type = 'text'},
},
{
{text = 'الغاء الامر',type = 'text'},
},
}
}
return Lualoner.sendText(msg_chat_id,msg_id,'  • اهلا بك عزيزي المطور  . ', 'md', false, false, false, false, reply_markup)
end
end
if text == 'تفعيل الاشتراك الاجباري'  then
if not msg.ControllerBot then 
return
end 
Redis:set(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id,true)
return Lualoner.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' then
if not msg.ControllerBot then 
return
end 
Redis:del(Theloner..'Theloner:Channel:Join')
return Lualoner.sendText(msg_chat_id,msg_id,"\n• تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري'  then
if not msg.ControllerBot then 
return
end 
Redis:set(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id,true)
return Lualoner.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تغيير كليشه ستارت' then 
if not msg.ControllerBot then 
return
end 
Redis:setex(Theloner.."Theloner:Change:Start:Bot"..msg.sender_id.user_id,300,true) 
return Lualoner.sendText(msg_chat_id,msg_id,"• ارسل لي كليشه الان ","md",true)  
end
if text == 'حذف كليشه ستارت' then 
if not msg.ControllerBot then 
return
end 
Redis:del(Theloner.."Theloner:Start:Bot") 
return Lualoner.sendText(msg_chat_id,msg_id,"• تم حذف كليشه البدا ","md",true)   
end
if Redis:get(Theloner.."Theloner:Change:Start:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(Theloner.."Theloner:Change:Start:Bot"..msg.sender_id.user_id) 
return Lualoner.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير كليشه البدا","md",true)  
end 
Redis:del(Theloner.."Theloner:Change:Start:Bot"..msg.sender_id.user_id) 
Redis:set(Theloner.."Theloner:Start:Bot",text) 
return Lualoner.sendText(msg_chat_id,msg_id, "• تم تغيير كليشه البدا\n "..text,"md",true)    
end 
---

if (Redis:get(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر' then 
Redis:del(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
return Lualoner.sendText(msg_chat_id,msg_id,'• تم الغاء حفظ قناة الاشتراك')
end
Redis:del(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = Lualoner.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(Theloner..'Theloner:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
return Lualoner.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = Lualoner.getChatMember(UserId_Info.id,Theloner).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return Lualoner.sendText(msg_chat_id,msg_id,"\n• البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(Theloner..'Theloner:Channel:Join',ChannelUser) 
Redis:set(Theloner..'Theloner:Channel:Join:Name',UserId_Info.title) 
return Lualoner.sendText(msg_chat_id,msg_id,"\n• تم تعيين الاشتراك الاجباري على قناة : [ @"..ChannelUser..' ]',"md",true)  
else
return Lualoner.sendText(msg_chat_id,msg_id,"\n• هاذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [ @"..ChannelUser..' ]',"md",true)  
end end end

end -- رن ( UserBot )
end
end
function paakloner(data) --- ملف 2
if data and data.luatele and data.luatele == "updateNewMessage" then  
if tonumber(data.message.sender_id.user_id) == tonumber(Theloner) then
return false
end
File_Bot_Run(data.message,data.message)
elseif data and data.luatele and data.luatele == "updateMessageEdited" then
local Message_Edit = Lualoner.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Theloner then
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
Text = Lualoner.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Theloner..":lolEmoje:ar"..UserId,500,true)
Lualoner.editMessageText(ChatId,Msg_id,"• ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Theloner..":lolEmoje:en"..UserId,500,true)
Lualoner.editMessageText(ChatId,Msg_id,"• ارسل الاسم بلانجليزيه", 'md', false)
end
end
end 
end
luatele.run(paakloner)(paakloner)

