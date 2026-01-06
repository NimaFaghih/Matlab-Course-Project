function checkCollisions(fig)

    g = guidata(fig);
    if strcmp(g.bullet.state, 'fire')
        enemies_hit = false(1, g.numEnemies);
        bullet1_active = true;
        bullet2_active = g.double_shot_active;

        for i = 1:g.numEnemies
            if enemies_hit(i), continue; end
            main_hit = bullet1_active && abs(g.bullet.x - g.enemies(i).x) < 30 && abs(g.bullet.y - g.enemies(i).y) < 30;
            second_hit = bullet2_active && abs(g.bullet2.x - g.enemies(i).x) < 30 && abs(g.bullet.y - g.enemies(i).y) < 30;

            if main_hit || second_hit
                enemies_hit(i) = true;
                
                g.enemies(i).x = randi([0 735]);
                g.enemies(i).y = 480;

                
                g.score = g.score + 1;
                g.consecutive_hits = g.consecutive_hits + 1;

                if g.consecutive_hits >= 3 && ~g.double_shot_active
                    g.double_shot_active = true;
                    g.consecutive_hits = 0;
                end

                if main_hit
                    bullet1_active = false;
                    if ~bullet2_active
                        g.bullet.state = 'ready';
                        g.bullet.y = g.player.y + g.player.height * 0.8;
                        g.bullet2.y = g.bullet.y;
                        set(g.gfx.bulletSprite, 'Visible', 'off');
                    end
                end
                if second_hit
                    bullet2_active = false;
                    set(g.gfx.bulletSprite2, 'Visible', 'off');
                    if ~bullet1_active
                        g.bullet.state = 'ready';
                        g.bullet.y = g.player.y + g.player.height * 0.8;
                        g.bullet2.y = g.bullet.y;
                        set(g.gfx.bulletSprite, 'Visible', 'off');
                    end
                end

                set(g.gfx.scoreText, 'String', sprintf('Score: %d', g.score));
                updatePowerupStatus(fig);
            end
        end

        
        if bullet1_active
            set(g.gfx.bulletSprite, 'XData', g.bullet.x, 'YData', g.bullet.y);
        end
        if bullet2_active
            set(g.gfx.bulletSprite2, 'XData', g.bullet2.x, 'YData', g.bullet.y);
        end

        if g.bullet.y >= 600
            g.bullet.state = 'ready';
            g.bullet.y = g.player.y + g.player.height * 0.8;
            g.bullet2.y = g.bullet.y;
            set(g.gfx.bulletSprite, 'Visible', 'off');
            set(g.gfx.bulletSprite2, 'Visible', 'off');
            g.consecutive_hits = 0;
            g.double_shot_active = false;
            updatePowerupStatus(fig);
        end

        if ~bullet1_active && ~bullet2_active && strcmp(g.bullet.state, 'fire')
            g.bullet.state = 'ready';
            g.bullet.y = g.player.y + g.player.height * 0.8;
            g.bullet2.y = g.bullet.y;
        end
    end
    guidata(fig, g);
end