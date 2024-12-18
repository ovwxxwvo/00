﻿# -*- coding: utf-8 -*-

import sys
import xbmc, xbmcgui, xbmcaddon
try:
    import simplejson
except ImportError:
    import json as simplejson
# import httplib

__addon__      = xbmcaddon.Addon()
# __cwd__        = __addon__.getAddonInfo('path').decode("utf-8")
__cwd__        = __addon__.getAddonInfo('path')
__language__   = __addon__.getLocalizedString

ACTION_PREVIOUS_MENU = 10

FONTSIZE = 10

CAPS, LOWER, SYMBOLS = range(3)
symbol_map = ")!@#$%^&*([]{}-_=+;:\'\",.<>/?\\|`~    "

CTL_BUTTON_DONE       = 300
CTL_BUTTON_CANCEL     = 301
CTL_BUTTON_CHINESE    = 302  # use SHIFT for chinese switch
CTL_BUTTON_CAPS       = 303
CTL_BUTTON_SYMBOLS    = 304
CTL_BUTTON_LEFT       = 305
CTL_BUTTON_RIGHT      = 306
CTL_BUTTON_IP_ADDRESS = 307

CTL_LABEL_HEADING     = 311

CTL_BUTTON_BACKSPACE  = 8

# For Kodi 14
BUTTON_ID_OFFSET = 100
BUTTONS_PER_ROW  = 20
CTL_BUTTON_LAYOUT = 309
key_map = ["0123456789",
           "qwertyuiop",
           "asdfghjkl",
           "zxcvbnm"]
key_map_cap = ["0123456789",
               "QWERTYUIOP",
               "ASDFGHJKL",
               "ZXCVBNM"]
key_map_sym = [")!@#$%^&*(",
               "[]{}-_=+;:",
               "'\",.<>/?\\|",
               "`~"]

# UserAgent  = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3'
# BAIDU_API_BASE = 'olime.baidu.com'
# BAIDU_API_URL  = '/py?input=%s&inputtype=py&bg=%d&ed=%d&result=hanzi&resultcoding=unicode&ch_en=0&clientinfo=web'

# class HttpClient(object):
#     def __init__(self, address):
#         self.address = address
#         self.conn = httplib.HTTPConnection(address)
#         self.headers = {'User-Agent':UserAgent}
#
#     def Get(self, url):
#         try:
#             self.conn.request(method='GET', url=url, headers=self.headers)
#         except Exception as e:
#             self.conn = httplib.HTTPConnection(self.address)
#             self.conn.request(method='GET', url=url, headers=self.headers)
#         res = self.conn.getresponse()
#         httpdata = res.read()
#         if 'Cookie' not in self.headers and res.getheader('Set-Cookie'):
#             self.headers['Cookie'] = res.getheader('Set-Cookie').split(';')[0]
#         return httpdata

class InputWindow(xbmcgui.WindowXMLDialog):
    def __init__( self, *args, **kwargs ):
        self.Kodi14 = False
        self.CTL_NUM_START = 48
        self.CTL_NUM_END   = 57
        self.CTL_LABEL_EDIT = 310
        # self.strEdit = kwargs.get("default").decode('utf-8') or u""
        self.strEdit = kwargs.get("default") or u""
        self.strHeading = kwargs.get("heading") or ""
        self.bIsConfirmed = False
        self.bChinese = False
        self.keyType = LOWER
        self.words = []
        self.hzcode = ''
        self.pos = 0
        self.num = 0
        # self.HTTP = HttpClient(BAIDU_API_BASE)
        xbmcgui.WindowXMLDialog.__init__(self)

    def onInit(self):
        try:
            pCtl = self.getControl(self.CTL_LABEL_EDIT)
            self.getControl(self.CTL_LABEL_EDIT).setLabel(self.strEdit)
        except:
            self.CTL_LABEL_EDIT = 312
            self.getControl(self.CTL_LABEL_EDIT).setText(self.strEdit)
            #self.getControl(self.CTL_LABEL_EDIT).setEnabled(False)
        try:
            pCtl = self.getControl(self.CTL_NUM_START)
        except:
            self.Kodi14 = True
            self.CTL_NUM_START = 100
            self.CTL_NUM_END   = 109
            self.getControl(CTL_BUTTON_LAYOUT).setLabel("")
        self.initControl()
        self.getControl(CTL_LABEL_HEADING).setLabel(self.strHeading)
        self.getControl(CTL_BUTTON_CHINESE).setLabel('中文')
        self.UpdateButtons()

    def initControl(self):
        pEdit = self.getControl(self.CTL_LABEL_EDIT)
        px = pEdit.getX()
        py = pEdit.getY()
        pw = pEdit.getWidth()
        ph = pEdit.getHeight()
        self.listw = pw - 95
        self.CTL_HZCODE = xbmcgui.ControlLabel(px, py + ph, 90, 30, '')
        self.CTL_HZLIST = xbmcgui.ControlLabel(px + 95, py + ph, pw - 95, 30, '')
        self.addControl(self.CTL_HZCODE)
        self.addControl(self.CTL_HZLIST)

    def onFocus(self, controlId):
        self.controlId = controlId

    def onClick(self, controlID):
        if controlID == CTL_BUTTON_DONE:
            self.OnOK()
        elif controlID == CTL_BUTTON_CANCEL:
            self.close()
        elif controlID == CTL_BUTTON_CHINESE:
            self.OnChinese()
        elif controlID == CTL_BUTTON_CAPS:
            if self.keyType == LOWER:
                self.keyType = CAPS
            elif self.keyType == CAPS:
                self.keyType = LOWER
            self.UpdateButtons()
        elif controlID == CTL_BUTTON_SYMBOLS:
            self.OnSymbols()
        elif controlID == CTL_BUTTON_LEFT:
            if self.bChinese and len(self.words) > 0:
                self.ChangeWordList(-1)
        elif controlID == CTL_BUTTON_RIGHT:
            if self.bChinese and len(self.words) > 0:
                self.ChangeWordList(1)
        elif controlID == CTL_BUTTON_IP_ADDRESS:
            self.OnIPAddress()
        else:
            self.OnClickButton(controlID)

    def onAction(self,action):
        actionID = action.getId()
        keycode = action.getButtonCode()
        ch = keycode & 0xFF
        #self.getControl(CTL_LABEL_HEADING).setLabel('%d %d %X %d' %(actionID, keycode, keycode, ch))

        if keycode >= 0xF000 and keycode < 0xF100:
        # input from the keyboard
            # Ignore non-printing characters
            if not ((0 <= ch and ch < 0x8) or (0xE <= ch and ch < 0x1B) or (0x1C <= ch and ch < 0x20) or (0x7f < ch)):
                if ch == 0x8: # backspace
                    self.Backspace()
                elif ch == 0x9: pass # Tab (do nothing)
                elif ch == 0xB: pass # Non-printing character, ignore
                elif ch == 0xC: pass # Non-printing character, ignore
                elif ch == 0xA or ch == 0xD: pass # enter (do nothing)
                elif ch == 0x1B: # escape
                    self.close()
                elif ch == 0x7f: pass # Delete (do nothing)
                else:  # use character input
                    if ch >= ord('A') and ch <= ord('Z'):
                        if self.bChinese:
                            self.hzcode += chr(ch + 32)
                            self.CTL_HZCODE.setLabel(self.hzcode)
                            self.GetChineseWord()
                        else:
                            if self.keyType != CAPS:
                                ch += 32
                            self.Character(chr(ch))
                    elif self.bChinese and ch >= ord('0') and ch <= ord('9'):
                        i = self.pos + ch -48
                        if i < (self.pos + self.num):
                            self.hzcode = ""
                            self.CTL_HZCODE.setLabel(self.hzcode)
                            self.Character(self.words[i])
                    elif self.bChinese and ch in (ord('<'), ord(',')) and len(self.words) > 0:
                        self.ChangeWordList(-1)
                    elif self.bChinese and ch in (ord('>'), ord('.')) and len(self.words) > 0:
                        self.ChangeWordList(1)
                    else:
                        self.Character(chr(ch))
        elif action.getId() == ACTION_PREVIOUS_MENU:
            self.close()

    def isConfirmed(self):
        return self.bIsConfirmed

    def getText(self):
        # return self.strEdit.encode('utf-8')
        return self.strEdit

    def UpdateButtons(self):
        if self.bChinese:
            # show the button depressed
            self.getControl(CTL_BUTTON_CHINESE).setSelected(True)
            self.CTL_HZCODE.setVisible(True)
            self.CTL_HZLIST.setVisible(True)
        else:
            self.getControl(CTL_BUTTON_CHINESE).setSelected(False)
            self.CTL_HZCODE.setVisible(False)
            self.CTL_HZLIST.setVisible(False)
        if self.keyType == CAPS:
            self.getControl(CTL_BUTTON_CAPS).setSelected(True)
        else:
            self.getControl(CTL_BUTTON_CAPS).setSelected(False)
        if self.keyType == SYMBOLS:
            self.getControl(CTL_BUTTON_SYMBOLS).setSelected(True)
        else:
            self.getControl(CTL_BUTTON_SYMBOLS).setSelected(False)
        if self.Kodi14:
            if self.keyType == SYMBOLS:
                map = key_map_sym
            elif self.keyType == CAPS:
                map = key_map_cap
            else:
                map = key_map
            for i in range(0, 4):
                for j in range(0, len(map[i])):
                    iButton = (i * BUTTONS_PER_ROW) + j + BUTTON_ID_OFFSET
                    aLabel = map[i][j]
                    self.getControl(iButton).setLabel(aLabel)
                    self.getControl(iButton).setVisible(True)
                j += 1
                while j <= 11:
                    iButton = (i * BUTTONS_PER_ROW) + j + BUTTON_ID_OFFSET
                    self.getControl(iButton).setVisible(False)
                    j += 1
        else:
            # set numerals
            for iButton in range(self.CTL_NUM_START, self.CTL_NUM_END+1):
                if self.keyType == SYMBOLS:
                    aLabel = symbol_map[iButton - self.CTL_NUM_START]
                else:
                    aLabel = chr(iButton - self.CTL_NUM_START + ord('0'))
                self.getControl(iButton).setLabel(aLabel)
            # set correct alphabet characters...
            for iButton in range(65, 90+1):
                # set the correct case...
                if self.keyType == LOWER:
                    # make lower case
                    aLabel = chr(iButton - 65 + ord('a'))
                elif self.keyType == SYMBOLS:
                    aLabel = symbol_map[iButton - 65 + 10]
                else:
                    aLabel = chr(iButton - 65 + ord('A'))
                self.getControl(iButton).setLabel(aLabel)

    def OnOK(self):
        self.bIsConfirmed = True
        self.close()

    def OnChinese(self):
        self.bChinese = not self.bChinese
        self.UpdateButtons()

    def OnSymbols(self):
        if self.keyType == SYMBOLS:
            self.keyType = LOWER
        else:
            self.keyType = SYMBOLS
        self.UpdateButtons()

    def OnIPAddress(self):
        dialog = xbmcgui.Dialog()
        ip = dialog.numeric( 3, xbmc.getLocalizedString(14068), '' )
        self.strEdit += ip
        self.UpdateLabel()

    def UpdateLabel(self):
        if self.CTL_LABEL_EDIT == 310:
            self.getControl(self.CTL_LABEL_EDIT).setLabel(self.strEdit)
        else:
            self.getControl(self.CTL_LABEL_EDIT).setText(self.strEdit)

    def Backspace(self):
        if self.bChinese and len(self.hzcode)>0:
            self.hzcode = self.hzcode[:-1]
            self.CTL_HZCODE.setLabel(self.hzcode)
            self.GetChineseWord()
        elif len(self.strEdit) > 0:
            self.strEdit = self.strEdit[:-1]
            self.UpdateLabel()

    def OnClickButton(self, controlId):
        if controlId == CTL_BUTTON_BACKSPACE:
            self.Backspace()
        else:
            self.GetCharacter(controlId)

    def GetCharacter(self, iButton):
        if iButton >= self.CTL_NUM_START and iButton <= self.CTL_NUM_END:
            # First the number buttons
            if self.keyType == SYMBOLS:
                self.Character(self.getControl(iButton).getLabel()[0])
                self.OnSymbols()
            elif self.bChinese:
                i = self.pos + iButton - self.CTL_NUM_START
                if i < (self.pos + self.num):
                    self.hzcode = ""
                    self.CTL_HZCODE.setLabel(self.hzcode)
                    self.Character(self.words[i])
            else:
                self.Character(chr(iButton - self.CTL_NUM_START + 48))
        elif iButton == 32:
            # space button
            self.Character(chr(iButton))
        elif (self.Kodi14 and iButton >= 100 and iButton < 180) or (not self.Kodi14 and iButton >= 65 and iButton < 91):
            # alphabet character buttons
            ch = self.getControl(iButton).getLabel()[0]
            if self.keyType == SYMBOLS:
                self.OnSymbols()
            elif self.keyType == LOWER:
                if self.bChinese:
                  self.hzcode += ch
                  self.CTL_HZCODE.setLabel(self.hzcode)
                  self.GetChineseWord()
                  return
            self.Character(ch)

    def Character(self, str):
        self.strEdit += str
        self.UpdateLabel()

    def GetChineseWord(self, isFirstPage=True):
        if isFirstPage:
            self.pos = 0
            self.words = []
            self.api_bg = 0  # baidu api begin num
            self.api_ed = 20 # baidu api end num
            self.api_all = False
        else:
            if self.api_all:
                return False
            self.api_bg += 20
            self.api_ed += 20
        self.CTL_HZLIST.setLabel("")
        if len(self.hzcode) > 0:
            url = BAIDU_API_URL % (self.hzcode, self.api_bg, self.api_ed)
            # httpdata = self.HTTP.Get(url)
            httpdata = 'abc'
            try:
                jsondata = simplejson.loads(httpdata)
            except ValueError:
                return False
            for word in jsondata[0]:
                self.words.append(word[0])
            if len(jsondata[0]) < 20:
                self.api_all = True
            if isFirstPage:
                self.ChangeWordList(0)
            return True

    def getStringWidth(self, str):
        gbkstr = str.encode('gbk')
        return(len(gbkstr) * FONTSIZE)

    def ChangeWordList(self, direct):
        hzlist = ""
        width = FONTSIZE * 2 # width for '<' and '>'
        spacewidth = FONTSIZE # ' '
        numwidth = FONTSIZE * 2 # '1.'

        if direct >= 0:
            self.pos += self.num
            if direct == 0 or self.pos > len(self.words) - 1:
                self.pos = 0
            i = 0
            while True:
                if i == len(self.words) - self.pos:
                    if self.api_all or not self.GetChineseWord(False):
                        break
                if (i > 0 and width + self.getStringWidth(self.words[self.pos + i]) + numwidth > self.listw) or i > 9:
                    break
                hzlist += chr(i + 48) + '.' + self.words[self.pos + i].encode('utf-8') + ' '
                width += self.getStringWidth(self.words[self.pos + i]) + numwidth + spacewidth
                i += 1
            self.num = i
        else:
            if self.pos == 0:
                return
            for i in range(9+1):
                if (i > 0 and width + self.getStringWidth(self.words[self.pos - i]) + numwidth > self.listw) or self.pos - i < 0:
                    i -= 1
                    break
                width += self.getStringWidth(self.words[self.pos - i]) + numwidth + spacewidth
            self.num = i + 1
            self.pos = self.pos - self.num
            for i in range(self.num):
                hzlist += chr(i + 48) + '.' + self.words[self.pos + i].encode('utf-8') + ' '

        #self.getControl(CTL_LABEL_HEADING).setLabel('pos:%d num:%d' %(self.pos, self.num))
        hzlist.rstrip()
        if self.pos > 0: hzlist = '<' + hzlist
        if (self.pos + self.num < len(self.words)) or self.GetChineseWord(False):
            hzlist += '>'
        self.CTL_HZLIST.setLabel(hzlist)

class Keyboard:
    def __init__( self, default='', heading='' ):
        self.bIsConfirmed = False
        self.strEdit = default
        self.strHeading = heading

    def doModal (self):
        self.win = InputWindow("DialogKeyboard.xml", __cwd__, heading=self.strHeading, default=self.strEdit )
        self.win.doModal()
        self.bIsConfirmed = self.win.isConfirmed()
        self.strEdit = self.win.getText()
        del self.win

    def setHeading(self, heading):
        self.strHeading = heading

    def isConfirmed(self):
        return self.bIsConfirmed

    def getText(self):
        return self.strEdit


