function restartGame(~, ~)
    f = gcbf;
    if ~isempty(f) && ishandle(f)
        close(f);
    end
    SpaceGame();
end