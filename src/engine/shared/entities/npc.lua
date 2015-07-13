--========= Copyright © 2013-2015, Planimeter, All rights reserved. ==========--
--
-- Purpose: NPC class
--
--============================================================================--

require( "engine.shared.entities.character" )

class "npc" ( "character" )

function npc:npc()
	character.character( self )

	local tileSize = game.tileSize
	if ( _CLIENT ) then
		self:setLocalPosition( vector( 0, tileSize ) )
	end

	local min = vector()
	local max = vector( tileSize, -tileSize )
	self:setCollisionBounds( min, max )

	self:networkNumber( "moveSpeed", 2 )

	if ( _CLIENT ) then
		self:setSprite( player.sprite )
	end
end

function npc:spawn()
	entity.spawn( self )
	game.call( "shared", "onNPCSpawn", self )
end

function npc:__tostring()
	return "npc: " .. self:getName()
end