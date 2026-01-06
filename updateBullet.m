function updateBullet(fig)
    g = guidata(fig);
    if strcmp(g.bullet.state, 'fire')
        g.bullet.y = g.bullet.y + g.bullet.speed;

        if g.double_shot_active
            g.bullet2.y = g.bullet.y;
            g.bullet.x = g.player.x + g.player.width * 0.25 - g.bullet.width/2;
            g.bullet2.x = g.player.x + g.player.width * 0.75 - g.bullet.width/2;
            set(g.gfx.bulletSprite, 'XData', g.bullet.x, 'YData', g.bullet.y);
            set(g.gfx.bulletSprite2, 'XData', g.bullet2.x, 'YData', g.bullet2.y);
        else
            g.bullet.x = g.player.x + (g.player.width - g.bullet.width)/2;
            set(g.gfx.bulletSprite, 'XData', g.bullet.x, 'YData', g.bullet.y);
        end

        if g.bullet.y >= 600
            g.bullet.state = 'ready';
            g.bullet.y = g.player.y + g.player.height * 0.8;
            g.bullet2.y = g.bullet.y;
            set(g.gfx.bulletSprite, 'Visible', 'off');
            set(g.gfx.bulletSprite2, 'Visible', 'off');
            g.consecutive_hits = 0;
            updatePowerupStatus(fig);
        end
    end
    guidata(fig, g);
end