local composer = require( "composer" )

local physics = require("physics")

 

local scene = composer.newScene()



function scene:create( event )

 

    local sceneGroup = self.view

    -- start physics

    physics.start()

    physics.setGravity(0, 32)

 

end



function scene:show( event )

 

    local sceneGroup = self.view

    local phase = event.phase

 

    if ( phase == "will" ) then

        local background = display.newRect(display.contentCenterX, display.contentCenterY, 1000, 1000)

        background:setFillColor( 53/255,235/255,242/255 )

        sceneGroup:insert( background )



        local theGround1 = display.newImage( "assets/land.png" )

        theGround1.x = 160

        theGround1.y = display.contentHeight

        theGround1.id = "the ground"

        physics.addBody( theGround1, "static", { 

            friction = 0.5, 

            bounce = 0.3 

            } )

        sceneGroup:insert( theGround1 )





        local character = display.newImage( "assets/character.png" )

        character.x = 160

        character.y = -200

        character.width = 240

        character.height = 180

        character.id = "character"

        physics.addBody( character, "dynamic", { 

            friction = 0.5, 

            bounce = 0.3 

            } )

        sceneGroup:insert( character )

 

    elseif ( phase == "did" ) then

        -- Code here runs when the scene is entirely on screen

 

    end

end



function scene:hide( event )

 

    local sceneGroup = self.view

    local phase = event.phase

 

    if ( phase == "will" ) then

        -- Code here runs when the scene is on screen (but is about to go off screen)

 

    elseif ( phase == "did" ) then

        -- Code here runs immediately after the scene goes entirely off screen

 

    end

end



function scene:destroy( event )

 

    local sceneGroup = self.view

    -- Code here runs prior to the removal of scene's view

 

end



scene:addEventListener( "create", scene )

scene:addEventListener( "show", scene )

scene:addEventListener( "hide", scene )

scene:addEventListener( "destroy", scene )



return scene