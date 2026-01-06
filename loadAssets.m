function assets = loadAssets()
    try
        assets.background = imread('image/background.png');
        [assets.playerImg, ~, assets.playerAlpha] = imread('image/space-invaders.png');
        [assets.enemyImg, ~, assets.enemyAlpha] = imread('image/alien.png');
        [assets.bulletImg, ~, assets.bulletAlpha] = imread('image/bullet.png');

        [assets.playerHeight, assets.playerWidth, ~] = size(assets.playerImg);
        [assets.bulletHeight, assets.bulletWidth, ~] = size(assets.bulletImg);

        assets.playerImg = imrotate(assets.playerImg, 180, 'bilinear', 'crop');
        assets.playerAlpha = imrotate(assets.playerAlpha, 180, 'bilinear', 'crop');
        assets.enemyImg = imrotate(assets.enemyImg, 180, 'bilinear', 'crop');
        assets.enemyAlpha = imrotate(assets.enemyAlpha, 180, 'bilinear', 'crop');
        assets.bulletImg = imrotate(assets.bulletImg, 180, 'bilinear', 'crop');
        assets.bulletAlpha = imrotate(assets.bulletAlpha, 180, 'bilinear', 'crop');
    catch
        error('Unable to load game images. Make sure they are in the correct directory.');
    end
end