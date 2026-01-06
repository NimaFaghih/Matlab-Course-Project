function updateDifficulty(fig)

    g = guidata(fig);
    old_difficulty = g.difficulty_level;

    if g.score >= 20
        g.difficulty_level = 4;  % Very Hard
    elseif g.score >= 15
        g.difficulty_level = 3;  % Hard
    elseif g.score >= 10
        g.difficulty_level = 2;  % Medium
    else
        g.difficulty_level = 1;  % Normal
    end

    if old_difficulty ~= g.difficulty_level
        new_num_enemies = g.numEnemies;
        switch g.difficulty_level
            case 2
                new_num_enemies = 8; speed_multiplier = 1.2;
            case 3
                new_num_enemies = 10; speed_multiplier = 1.4;
            case 4
                new_num_enemies = 12; speed_multiplier = 1.6;
            otherwise
                new_num_enemies = 6; speed_multiplier = 1;
        end

        if new_num_enemies > g.numEnemies
            for i = (g.numEnemies + 1):new_num_enemies
                g.gfx.enemySprites(i) = image(g.ax, randi([0 735]), 480, g.assets.enemyImg, 'AlphaData', g.assets.enemyAlpha);
                g.enemies(i).x = randi([0 735]);
                g.enemies(i).y = 480;
                g.enemies(i).speedX = sign(rand - 0.5) * abs(g.base_enemy_speed_x) * speed_multiplier;
                g.enemies(i).speedY = g.base_enemy_speed_y * speed_multiplier;
            end
        end

        for i = 1:g.numEnemies
            g.enemies(i).speedX = sign(g.enemies(i).speedX) * abs(g.base_enemy_speed_x) * speed_multiplier;
            g.enemies(i).speedY = g.base_enemy_speed_y * speed_multiplier;
        end

        g.numEnemies = new_num_enemies;

        diff_msg = '';
        switch g.difficulty_level
            case 2, diff_msg = 'MEDIUM DIFFICULTY!';
            case 3, diff_msg = 'HARD DIFFICULTY!';
            case 4, diff_msg = 'VERY HARD DIFFICULTY!';
        end

        if ~isempty(diff_msg)
            diff_text = text(400, 300, diff_msg, 'Color', 'red', 'FontSize', 24, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
            timer = tic;
            while toc(timer) < 2
                drawnow;
            end
            delete(diff_text);
        end
    end
    guidata(fig, g);
end