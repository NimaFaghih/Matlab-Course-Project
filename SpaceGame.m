function SpaceGame()
    close all;
    clearvars;

    [fig, ax] = setupFigure();
    assets = loadAssets();

    g = initGameState(fig, ax, assets);
    guidata(fig, g);

    set(fig, 'KeyPressFcn', @keyPressedCallback);
    set(fig, 'KeyReleaseFcn', @keyReleasedCallback);

    while ishandle(fig)
        g = guidata(fig);
        if g.gameOver
            break;
        end
        updateDifficulty(fig);
        updatePlayer(fig);
        updateEnemies(fig);
        updateBullet(fig);
        checkCollisions(fig);
        drawnow;
        pause(0.016);
    end

    if ishandle(fig)
        overlay = patch([0 800 800 0], [0 0 600 600], 'black', ...
                       'FaceAlpha', 0.7, ...
                       'EdgeColor', 'none');

        text(400, 300, 'GAME OVER', 'Color', 'green', 'FontSize', 48, 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
        text(400, 350, sprintf('Final Score: %d', g.score), 'Color', 'white', 'FontSize', 24, 'HorizontalAlignment', 'center');

        uicontrol('Style', 'pushbutton', 'String', 'Play Again', 'Position', [300 200 200 40], ...
                  'BackgroundColor', [0 0.8 0], 'ForegroundColor', 'white', 'FontSize', 14, 'FontWeight', 'bold', ...
                  'Callback', @restartGame);

        uicontrol('Style', 'pushbutton', 'String', 'Exit Game', 'Position', [300 140 200 40], ...
                  'BackgroundColor', [0.8 0 0], 'ForegroundColor', 'white', 'FontSize', 14, 'FontWeight', 'bold', ...
                  'Callback', @exitGame);

        drawnow;
    end
            
