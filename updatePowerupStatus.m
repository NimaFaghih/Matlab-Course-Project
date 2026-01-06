function updatePowerupStatus(fig)
    g = guidata(fig);
    if g.double_shot_active
        set(g.gfx.powerupText, 'String', 'DOUBLE SHOT ACTIVE!');
    elseif g.consecutive_hits > 0
        set(g.gfx.powerupText, 'String', sprintf('Hits to Double Shot: %d', 3 - g.consecutive_hits));
    else
        set(g.gfx.powerupText, 'String', '');
    end
    guidata(fig, g);
end