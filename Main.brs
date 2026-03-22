'*************************************************************
'** Hello World example 
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK License Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

sub Main()
    ' 1. Create the SceneGraph screen object
    screen = CreateObject("roSGScreen")
    
    ' 2. Create a message port to listen for system events (like closing the app)
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    ' 3. Create the SharkGame scene defined in your XML
    ' This name MUST match the name="SharkGame" in your SharkGame.xml
    scene = screen.CreateScene("SharkGame")
    
    ' 4. Show the screen to the user
    screen.show()

    ' 5. Event Loop: This keeps the app running. 
    ' Without this, the app will start and immediately close.
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub




