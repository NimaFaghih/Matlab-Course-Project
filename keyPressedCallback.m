function keyPressedCallback(src, event)
    g = guidata(src);
    switch event.Key
        case 'leftarrow'
            g.player.speed = -5;
        case 'rightarrow'
            g.player.speed = 5;
        case 'space'
            if strcmp(g.bullet.state, 'ready')
                g.bullet.state = 'fire';
                g.bullet.y = g.player.y + g.player.height * 0.8;

                if g.double_shot_active
                    set(g.gfx.bulletSprite, 'XData', g.player.x + g.player.width * 0.25 - g.bullet.width/2, 'YData', g.bullet.y);
                    set(g.gfx.bulletSprite2, 'XData', g.player.x + g.player.width * 0.75 - g.bullet.width/2, 'YData', g.bullet.y);
                    set(g.gfx.bulletSprite2, 'Visible', 'on');
                else
                    g.bullet.x = g.player.x + (g.player.width - g.bullet.width)/2;
                    set(g.gfx.bulletSprite, 'XData', g.bullet.x, 'YData', g.bullet.y);
                end
                set(g.gfx.bulletSprite, 'Visible', 'on');
            end
    end
    guidata(src, g);
end