function updateEnemies(fig)
    g = guidata(fig);
    for i = 1:g.numEnemies
        g.enemies(i).x = g.enemies(i).x + g.enemies(i).speedX;

        if g.enemies(i).x <= 0 || g.enemies(i).x >= 736
            g.enemies(i).speedX = -g.enemies(i).speedX;
            g.enemies(i).y = g.enemies(i).y + g.enemies(i).speedY;

            if g.difficulty_level >= 3
                g.enemies(i).speedX = sign(g.enemies(i).speedX) * (abs(g.base_enemy_speed_x) * (1.5 + rand * 0.5) * (g.difficulty_level - 1));
            end
        end

        if g.difficulty_level >= 2
            g.enemies(i).x = g.enemies(i).x + sin(g.enemies(i).y/30) * (g.difficulty_level - 1);
        end

        set(g.gfx.enemySprites(i), 'XData', g.enemies(i).x, 'YData', g.enemies(i).y);

        if g.enemies(i).y < 150
            g.gameOver = true;
            guidata(fig, g);
            return;
        end
    end
    guidata(fig, g);
end