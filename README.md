# AppleScriptAutoLoginAppStore
根据AppleScript脚本实现自动登录到mac  AppStore

实现效果

![Mou icon](https://github.com/WowJesse/images-Gifs/blob/master/jessemac.gif?raw=true)

AppleScript脚本代码


		-- Function for iTunes sign in
		property loginBtn : "登录…"
		property logoutBtn : "注销"
		-- Launch iTunes


		on run {para1, para2}
	
	
			tell application "App Store" to activate
	
			tell application "System Events"
			tell process "App Store"
				set frontmost to true
			
				try
					click menu item loginBtn of menu "商店" of menu bar 1
				on error
					click menu item logoutBtn of menu "商店" of menu bar 1
				delay 2
					click menu item loginBtn of menu "商店" of menu bar 1
				end try
			delay 1
			
				keystroke para1
				keystroke tab
			delay 1
			-- Type account password
				keystroke para2
			-- Press the return key
				keystroke return
			end tell
			end tell
		end run








