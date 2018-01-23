from __future__ import print_function
import platform
p = platform.system()
if p == 'Linux':
    import pyperclip
    #referer http://coffeeghost.net/2010/10/09/pyperclip-a-cross-platform-clipboard-module-for-python/
    f=open('/home/abui/www/xclip3')
    c=f.read()
    c=c.decode('gbk')
    pyperclip.copy(c)
    #print pyperclip.paste()
elif p == 'Windows':
    import win32clipboard,win32con
    win32clipboard.OpenClipboard()
    #win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardData(win32con.CF_TEXT, "Hello World!")
    print(win32clipboard.GetClipboardData(win32con.CF_TEXT))
    win32clipboard.CloseClipboard()
