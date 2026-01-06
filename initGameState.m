function g = initGameState(fig, ax, assets)
    player = struct('x', 370, 'y', 50, 'speed', 0, 'width', assets.playerWidth, 'height', assets.playerHeight);
    bullet = struct('x', 0, 'y', 50, 'speed', 15, 'state', 'ready', 'width', assets.bulletWidth, 'height', assets.bulletHeight);
    bullet2 = struct('x', 0, 'y', 50, 'speed', 15, 'state', 'ready', 'width', assets.bulletWidth, 'height', assets.bulletHeight);
    score = 0;
    gameOver = false;
    consecutive_hits = 0;
    double_shot_active = false;
    difficulty_level = 1;  

    
    numEnemies = 6;
    base_enemy_speed_x = 4;
    base_enemy_speed_y = -60;
    enemies = struct('x', num2cell(randi([0 735], 1, numEnemies)), ...
                    'y', num2cell(ones(1, numEnemies) * 480), ...
                    'speedX', num2cell(ones(1, numEnemies) * base_enemy_speed_x), ...
                    'speedY', num2cell(ones(1, numEnemies) * base_enemy_speed_y));

    
    image(ax, [0 800], [0 600], assets.background);
    playerSprite = image(ax, player.x, player.y, assets.playerImg, 'AlphaData', assets.playerAlpha);

    enemySprites = gobjects(1, numEnemies);
    for i = 1:numEnemies
        enemySprites(i) = image(ax, enemies(i).x, enemies(i).y, assets.enemyImg, 'AlphaData', assets.enemyAlpha);
    end

    bulletSprite = image(ax, bullet.x, bullet.y, assets.bulletImg, 'AlphaData', assets.bulletAlpha, 'Visible', 'off');
    bulletSprite2 = image(ax, bullet2.x, bullet2.y, assets.bulletImg, 'AlphaData', assets.bulletAlpha, 'Visible', 'off');

    scoreText = text(10, 580, sprintf('Score: %d', score), 'Color', 'green', 'FontSize', 14);
    powerupText = text(600, 580, '', 'Color', 'yellow', 'FontSize', 14);

    
    g.player = player;
    g.bullet = bullet;
    g.bullet2 = bullet2;
    g.enemies = enemies;
    g.score = score;
    g.gameOver = gameOver;
    g.consecutive_hits = consecutive_hits;
    g.double_shot_active = double_shot_active;
    g.difficulty_level = difficulty_level;
    g.numEnemies = numEnemies;
    g.base_enemy_speed_x = base_enemy_speed_x;
    g.base_enemy_speed_y = base_enemy_speed_y;
    g.assets = assets;
    g.ax = ax;
    g.fig = fig;

    
    g.gfx.playerSprite = playerSprite;
    g.gfx.enemySprites = enemySprites;
    g.gfx.bulletSprite = bulletSprite;
    g.gfx.bulletSprite2 = bulletSprite2;
    g.gfx.scoreText = scoreText;
    g.gfx.powerupText = powerupText;
end