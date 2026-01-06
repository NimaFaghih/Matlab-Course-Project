function updatePlayer(fig)
    g = guidata(fig);
    g.player.x = g.player.x + g.player.speed;
    g.player.x = max(0, min(736, g.player.x));
    set(g.gfx.playerSprite, 'XData', g.player.x);
    guidata(fig, g);
end